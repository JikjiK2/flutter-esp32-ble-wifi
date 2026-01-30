import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';

abstract class BleRepository {
  Stream<BleAdapterState> get adapterState;
  Stream<bool> get isScanning;
  Stream<List<BleDevice>> scanDevices();
  Future<void> stopDeviceScan();
  Future<void> connectDevice(String macId);
  Future<void> disconnectDevice();
  
  Future<void> sendLampStatus(String macId, LampStatus status, {String? description});
  
  Stream<LampStatus> statusStream(String macId);
  Stream<BleDeviceConnectionState> deviceStateStream(String macId);
  Future<void> turnOnBlueTooth();
  Future<int> readRssi(String macId);
}
