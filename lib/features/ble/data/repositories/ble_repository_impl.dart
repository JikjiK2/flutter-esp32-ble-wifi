import 'dart:async';
import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/data/datasources/ble_platform_datasource.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_logger.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/data/models/lamp_status_model.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_repository.dart';

part 'ble_repository_impl.g.dart';

class BleRepositoryImpl implements BleRepository {
  final BlePlatformDataSource _blePlatformDataSource;
  final BleLogger? _logger;

  String _buffer = "";
  bool _isWriting = false;

  BleRepositoryImpl(this._blePlatformDataSource, [this._logger]);

  @override
  Stream<BleAdapterState> get adapterState =>
      _blePlatformDataSource.adapterState.map((s) {
        final stateStr = s.toString().split('.').last;
        return BleAdapterState.values.firstWhere(
          (e) => e.name == stateStr,
          orElse: () => BleAdapterState.unknown,
        );
      });

  @override
  Stream<bool> get isScanning => _blePlatformDataSource.isScanning;

  @override
  Future<void> stopDeviceScan() async {
    await _blePlatformDataSource.stopDeviceScan();
  }

  @override
  Future<void> connectDevice(String macId) async {
    _blePlatformDataSource.connectDevice(macId);
  }

  @override
  Future<void> disconnectDevice() async {
    _blePlatformDataSource.disconnectDevice();
  }

  @override
  Future<void> sendLampStatus(String macId, LampStatus status, {String? description}) async {
    if (_isWriting) return;
    _isWriting = true;

    final command = jsonEncode({
      'r': status.red > 0 ? 255 : 0,
      'g': status.green > 0 ? 255 : 0,
      'b': status.blue > 0 ? 255 : 0,
      'brightness': status.brightness,
      'brightMode': status.brightMode,
      'ledMode': status.ledMode,
    });

    try {
      await _blePlatformDataSource.writeRawData(utf8.encode(command))
          .timeout(const Duration(milliseconds: 500));
      
      //  description이 있으면 로그에 포함
      final logMsg = description != null ? "$description: $command" : "TX 전송: $command";
      _logger?.logComm(logMsg);
    } catch (e) {
      _logger?.logComm("전송 에러: $e");
    } finally {
      _isWriting = false;
    }
  }

  @override
  Stream<LampStatus> statusStream(String macId) async* {
    await for (final value in _blePlatformDataSource.responseRawStream) {
      if (value.isEmpty) continue;
      final decoded = utf8.decode(value);

      _buffer += decoded;

      if (_buffer.contains('\n')) {
        final parts = _buffer.split('\n');
        _buffer = parts.last;

        for (int i = 0; i < parts.length - 1; i++) {
          final jsonStr = parts[i].trim();
          if (jsonStr.isEmpty) continue;

          try {
            final Map<String, dynamic> jsonData = jsonDecode(jsonStr);
            final entity = LampStatusModel.fromJson(jsonData).toEntity();
            _logger?.logData("온도: ${entity.temperature}°C | 습도: ${entity.humidity}% | 밝기: ${entity.brightness}");
            yield entity;
          } catch (e) {
            _logger?.logComm("파싱 에러: $e | 데이터: $jsonStr");
          }
        }
      }
    }
  }

  @override
  Stream<List<BleDevice>> scanDevices() {
    return _blePlatformDataSource.scanDevices().map(
      (models) => models.map((m) => m.toEntity()).toList(),
    );
  }

  @override
  Stream<BleDeviceConnectionState> deviceStateStream(String macId) {
    return _blePlatformDataSource.getDeviceStateStream(macId);
  }

  @override
  Future<void> turnOnBlueTooth() async {
    await _blePlatformDataSource.turnOnBluetooth();
  }

  @override
  Future<int> readRssi(String macId) async {
    return await _blePlatformDataSource.readRssi(macId);
  }
}

@Riverpod(keepAlive: true)
BlePlatformDataSource blePlatformDataSource(Ref ref) {
  return BlePlatformDataSourceImpl();
}
