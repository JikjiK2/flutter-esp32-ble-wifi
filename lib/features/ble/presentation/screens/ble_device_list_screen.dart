import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_connection_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_repository_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_scanner_providers.dart';

class BleDeviceListScreen extends ConsumerWidget {
  const BleDeviceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanResultsAsync = ref.watch(scanResultsProvider);
    final connectionState = ref.watch(bleConnectionProvider);
    final adapterState =
        ref.watch(bluetoothAdapterStateProvider).value ??
        BleAdapterState.unknown;
    final isScanning = ref.watch(isScanningProvider).value ?? false;

    final bool isBluetoothOff = adapterState != BleAdapterState.on;

    ref.listen(bluetoothAdapterStateProvider, (previous, next) {
      if (previous?.value == BleAdapterState.off &&
          next.value == BleAdapterState.on) {
        ref.invalidate(scanResultsProvider);
      }
    });

    ref.listen(bleConnectionProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('연결 실패: $error'),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('무드등 찾기'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(height: 1, thickness: 0.5, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(isScanning ? Icons.stop : Icons.refresh),
            onPressed: () {
              if (isBluetoothOff) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('블루투스를 먼저 켜주세요.')));
                return;
              }
              if (isScanning) {
                ref.read(bleRepositoryProvider).stopDeviceScan();
              } else {
                ref.invalidate(scanResultsProvider);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (isScanning) const LinearProgressIndicator(minHeight: 2),
          if (isBluetoothOff) _buildBluetoothOffBanner(ref),
          Expanded(
            child: isBluetoothOff
                ? _buildEmptyState('블루투스를 켜면 기기를 찾을 수 있습니다.')
                : scanResultsAsync.when(
                    data: (devices) => _buildDeviceList(
                      context,
                      ref,
                      devices,
                      connectionState,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('에러 발생: $e')),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bluetooth_disabled, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(message, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBluetoothOffBanner(WidgetRef ref) {
    return Container(
      width: double.infinity,
      color: Colors.orange.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange,
            size: 24,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              '블루투스 비활성화됨',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            onPressed: () => ref.read(bleRepositoryProvider).turnOnBlueTooth(),
            child: const Text('활성화'),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceList(
    BuildContext context,
    WidgetRef ref,
    List<BleDevice> devices,
    AsyncValue<String?> connectionState,
  ) {
    if (devices.isEmpty) return _buildEmptyState('주변에 무드등이 없습니다.');

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return Column(
          children: [
            _buildListTileStyle(context, ref, device, connectionState),
            const Divider(height: 1, thickness: 0.5),
          ],
        );
      },
    );
  }

  Widget _buildListTileStyle(
    BuildContext context,
    WidgetRef ref,
    BleDevice device,
    AsyncValue<String?> connectionState,
  ) {
    final stateAsync = ref.watch(bleDeviceStateProvider(device.macId));
    final isConnected = stateAsync.value == BleDeviceConnectionState.connected;
    final isConnecting =
        connectionState.isLoading && connectionState.asData?.value == null;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      onTap: isConnected ? () => _navigateToControl(context, device) : null,
      leading: _buildLeadingIcon(isConnected),
      title: Text(
        device.deviceName,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(device.macId, style: const TextStyle(fontSize: 13)),
      trailing: _buildTrailingButton(
        context,
        ref,
        device,
        isConnected,
        isConnecting,
        connectionState.isLoading,
      ),
    );
  }

  Widget _buildLeadingIcon(bool isConnected) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: isConnected
          ? Colors.amber.shade100
          : Colors.grey.shade100,
      child: Icon(
        isConnected ? Icons.lightbulb : Icons.lightbulb_outline,
        color: isConnected ? Colors.amber : Colors.grey,
        size: 28,
      ),
    );
  }

  Widget _buildTrailingButton(
    BuildContext context,
    WidgetRef ref,
    BleDevice device,
    bool isConnected,
    bool isConnecting,
    bool globalLoading,
  ) {
    if (isConnecting) {
      return const SizedBox(
        width: 32,
        height: 32,
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isConnected ? Colors.grey.shade200 : Colors.blue,
        foregroundColor: isConnected ? Colors.black87 : Colors.white,
        elevation: 0,
        shape: const StadiumBorder(),
        minimumSize: const Size(70, 36),
      ),
      onPressed: globalLoading
          ? null
          : () => _handleConnection(context, ref, device, isConnected),
      child: Text(
        isConnected ? '해제' : '연결',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  void _navigateToControl(BuildContext context, BleDevice device) {
    context.push('/ble_control/${device.macId}?name=${device.deviceName}');
  }

  void _handleConnection(
    BuildContext context,
    WidgetRef ref,
    BleDevice device,
    bool isConnected,
  ) async {
    final notifier = ref.read(bleConnectionProvider.notifier);

    if (isConnected) {
      await notifier.disconnect(device.macId);
    } else {
      await notifier.connect(device.macId);

      final currentState = ref.read(bleConnectionProvider);

      if (context.mounted && !currentState.hasError && currentState.hasValue) {
        _navigateToControl(context, device);
      }
    }
  }
}
