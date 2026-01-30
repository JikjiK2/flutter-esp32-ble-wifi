import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/data/models/ble_device_model.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';

const String ESP32_NAME_CONTAINS = "esp32";
const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
const String CHARACTERISTIC_UUID_RX = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
const String CHARACTERISTIC_UUID_TX = "cba1d466-344c-4be3-ab3f-189f80dd7518";

abstract class BlePlatformDataSource {
  Stream<BluetoothAdapterState> get adapterState;

  Stream<bool> get isScanning;

  Stream<List<BleDeviceModel>> scanDevices();

  Future<void> stopDeviceScan();

  Future<void> connectDevice(String macId);

  Future<void> disconnectDevice();

  Future<void> writeRawData(List<int> data);

  Stream<List<int>> get responseRawStream;

  Stream<BleDeviceConnectionState> getDeviceStateStream(String macId);

  Future<void> turnOnBluetooth();

  Future<int> readRssi(String macId);
}

class BlePlatformDataSourceImpl implements BlePlatformDataSource {
  BluetoothCharacteristic? _rxCharacteristic;
  BluetoothCharacteristic? _txCharacteristic;
  BluetoothDevice? _connectedDevice;

  final _responseController = StreamController<List<int>>.broadcast();
  StreamSubscription? _lastValueSubscription;

  @override
  Stream<BluetoothAdapterState> get adapterState async* {
    yield FlutterBluePlus.adapterStateNow;
    yield* FlutterBluePlus.adapterState;
  }

  @override
  Stream<bool> get isScanning => FlutterBluePlus.isScanning;

  @override
  Future<void> stopDeviceScan() => FlutterBluePlus.stopScan();

  @override
  Stream<List<BleDeviceModel>> scanDevices() {
    if (!FlutterBluePlus.isScanningNow) {
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
    }
    return FlutterBluePlus.scanResults.map((results) {
      return results
          .where((r) {
            final name = r.advertisementData.advName.toLowerCase();
            final pName = r.device.platformName.toLowerCase();
            return name.contains(ESP32_NAME_CONTAINS) ||
                pName.contains(ESP32_NAME_CONTAINS);
          })
          .map((r) => BleDeviceModel.fromScanResult(r))
          .toList();
    });
  }

  @override
  Future<void> connectDevice(String macId) async {
    if (FlutterBluePlus.isScanningNow) await FlutterBluePlus.stopScan();

    final device = BluetoothDevice.fromId(macId);
    _connectedDevice = device;

    try {
      await device.connect(
        timeout: const Duration(seconds: 10),
        license: License.free,
      );
      final services = await device.discoverServices();

      for (var s in services) {
        if (s.uuid.toString().toLowerCase() == SERVICE_UUID.toLowerCase()) {
          for (var c in s.characteristics) {
            if (c.uuid.toString().toLowerCase() ==
                CHARACTERISTIC_UUID_RX.toLowerCase()) {
              _rxCharacteristic = c;
            }
            if (c.uuid.toString().toLowerCase() ==
                CHARACTERISTIC_UUID_TX.toLowerCase()) {
              _txCharacteristic = c;

              await _txCharacteristic!.setNotifyValue(true);
              await _lastValueSubscription?.cancel();
              _lastValueSubscription = _txCharacteristic!.lastValueStream
                  .listen((value) {
                    if (value.isNotEmpty) {
                      _responseController.add(value);
                    }
                  }, onError: (e) => print("Stream Error: $e"));
            }
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> disconnectDevice() async {
    await _lastValueSubscription?.cancel();
    await _connectedDevice?.disconnect();
    _connectedDevice = null;
    _rxCharacteristic = null;
    _txCharacteristic = null;
  }

  @override
  Future<void> writeRawData(List<int> data) async {
    if (_connectedDevice == null || _rxCharacteristic == null) return;

    try {
      if (FlutterBluePlus.connectedDevices.contains(_connectedDevice)) {
        await _rxCharacteristic!.write(
          data,
          withoutResponse: _rxCharacteristic!.properties.writeWithoutResponse,
        );
      }
    } catch (e) {
      print("BLE Write Error: $e");
    }
  }

  @override
  Stream<List<int>> get responseRawStream => _responseController.stream;

  @override
  Stream<BleDeviceConnectionState> getDeviceStateStream(String macId) {
    return BluetoothDevice.fromId(macId).connectionState.map((s) {
      return s == BluetoothConnectionState.connected
          ? BleDeviceConnectionState.connected
          : BleDeviceConnectionState.disconnected;
    });
  }

  @override
  Future<void> turnOnBluetooth() => FlutterBluePlus.turnOn();

  @override
  Future<int> readRssi(String macId) async {
    try {
      final device = BluetoothDevice.fromId(macId);
      return await device.readRssi();
    } catch (_) {
      return -100;
    }
  }
}
