import 'dart:async';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_repository.dart';

class ConnectDeviceUseCase {
  final BleRepository _repository;

  ConnectDeviceUseCase(this._repository);

  /// 장치에 연결하고, 최소한의 초기 상태(LampStatus)가 수신될 때까지 대기합니다.
  Future<void> execute(String macId) async {
    await _repository.connectDevice(macId);

    try {
      await _repository
          .statusStream(macId)
          .first
          .timeout(const Duration(seconds: 2));
    } catch (_) {
    }
  }
}