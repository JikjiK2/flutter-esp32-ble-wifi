import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_connection_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_log_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_status_providers.dart';

import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_control_controller.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/widgets/rssi_badge.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/widgets/ble_info_card.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/widgets/ble_control_card.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/widgets/ble_color_card.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/widgets/ble_log_viewer.dart';

class BleControlScreen extends ConsumerStatefulWidget {
  final String macId;
  final String deviceName;

  const BleControlScreen({
    super.key,
    required this.macId,
    required this.deviceName,
  });

  @override
  ConsumerState<BleControlScreen> createState() => _BleControlScreenState();
}

class _BleControlScreenState extends ConsumerState<BleControlScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(
      bleControlControllerProvider(widget.macId).notifier,
    );
    final controlState = ref.watch(bleControlControllerProvider(widget.macId));
    final localStatus = controlState.localStatus;

    final lampStatusAsync = ref.watch(lampStatusProvider(widget.macId));
    final logState = ref.watch(bleDataLogProvider);
    final rssi = ref.watch(bleRssiProvider(widget.macId)).value ?? 0;

    ref.listen(bleDeviceStateProvider(widget.macId), (previous, next) {
      if (next.value == BleDeviceConnectionState.disconnected) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('장치와 연결이 종료되었습니다.')));
          context.go('/');
        }
      }
    });

    if (localStatus.temperature == 0 && localStatus.humidity == 0) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.deviceName)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(
                '${widget.deviceName}에서 데이터를 수신 중입니다...',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.deviceName, style: const TextStyle(fontSize: 18)),
            RssiBadge(rssi: rssi),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth_disabled, color: Colors.redAccent),
            onPressed: () => _confirmDisconnect(),
          ),
        ],
      ),
      body: lampStatusAsync.when(
        data: (_) => _buildBody(localStatus, logState, controller),
        loading: () => _buildBody(localStatus, logState, controller),
        error: (e, s) => Center(child: Text('연결 오류: $e')),
      ),
    );
  }

  Widget _buildBody(
    LampStatus status,
    BleLogState logState,
    BleControlController controller,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          BleInfoCard(status: status),
          const SizedBox(height: 16),
          BleControlCard(status: status, controller: controller),
          const SizedBox(height: 16),
          BleColorCard(status: status, controller: controller),
          const SizedBox(height: 16),
          BleLogViewer(logState: logState),
          const SizedBox(height: 24),
          _buildDisconnectButton(),
        ],
      ),
    );
  }

  Widget _buildDisconnectButton() {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () => _confirmDisconnect(),
      icon: const Icon(Icons.link_off),
      label: const Text('이 기기와 연결 해제'),
    );
  }

  Future<void> _confirmDisconnect() async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('연결 해제'),
        content: const Text('블루투스 연결을 종료하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('아니오'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('예', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (result == true) {
      await ref.read(bleConnectionProvider.notifier).disconnect(widget.macId);
    }
  }
}
