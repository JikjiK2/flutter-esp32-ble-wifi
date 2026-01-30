import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_repository_provider.dart';

part 'ble_scanner_providers.g.dart';

@riverpod
Stream<BleAdapterState> bluetoothAdapterState(Ref ref) {
  return ref.watch(bleRepositoryProvider).adapterState;
}

@riverpod
Stream<bool> isScanning(Ref ref) {
  return ref.watch(bleRepositoryProvider).isScanning;
}

@riverpod
Stream<List<BleDevice>> scanResults(Ref ref) {
  return ref.watch(bleRepositoryProvider).scanDevices();
}
