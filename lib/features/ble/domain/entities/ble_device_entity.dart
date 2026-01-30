import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_device_entity.freezed.dart';

@freezed
abstract class BleDevice with _$BleDevice {
  const factory BleDevice({
    required String deviceName,
    required String macId,
    required int rssi
  }) = _BleDevice;
}

enum BleDeviceConnectionState { disconnected, connected }

enum BleAdapterState {
  unknown,
  unavailable,
  unauthorized,
  poweredOff,
  poweredOn,
  on,
  off,
  unsupported,
}
