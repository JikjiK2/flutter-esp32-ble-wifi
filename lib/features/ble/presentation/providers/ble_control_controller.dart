import 'dart:async';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_connection_provider.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/presentation/providers/ble_status_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_control_controller.freezed.dart';

part 'ble_control_controller.g.dart';

@freezed
abstract class BleControlState with _$BleControlState {
  const factory BleControlState({
    required LampStatus localStatus,
    @Default(false) bool isInteracting,
  }) = _BleControlState;
}

@riverpod
class BleControlController extends _$BleControlController {
  Timer? _debounceTimer;
  Timer? _interactionTimer;

  @override
  BleControlState build(String macId) {
    final remoteStatus =
        ref.watch(lampStatusProvider(macId)).value ?? LampStatus.initial();
    final currentState = stateOrNull;
    final isInteracting = currentState?.isInteracting ?? false;

    if (isInteracting && currentState != null) {
      return currentState;
    }

    if (currentState != null && remoteStatus.ledMode == 0) {
      return BleControlState(
        localStatus: remoteStatus.copyWith(
          red: currentState.localStatus.red,
          green: currentState.localStatus.green,
          blue: currentState.localStatus.blue,
        ),
        isInteracting: false,
      );
    }

    return BleControlState(
      localStatus: remoteStatus.copyWith(
        red: remoteStatus.red > 0 ? 255 : 0,
        green: remoteStatus.green > 0 ? 255 : 0,
        blue: remoteStatus.blue > 0 ? 255 : 0,
      ),
      isInteracting: false,
    );
  }

  void updateControl({
    int? ledMode,
    int? brightMode,
    int? brightness,
    int? r,
    int? g,
    int? b,
  }) {
    String description = "명령 전송";
    if (ledMode != null) {
      description = "LED 모드 변경";
    } else if (brightMode != null) {
      description = "밝기 모드 변경";
    } else if (brightness != null) {
      description = "밝기 조절";
    } else if (r != null || g != null || b != null) {
      description = "색상 변경";
    }

    _interactionTimer?.cancel();
    _interactionTimer = Timer(const Duration(milliseconds: 2500), () {
      if (stateOrNull != null) {
        state = state.copyWith(isInteracting: false);
      }
    });

    final currentLocal = state.localStatus;

    final updatedLocalStatus = currentLocal.copyWith(
      ledMode: ledMode ?? currentLocal.ledMode,
      brightMode: brightMode ?? currentLocal.brightMode,
      brightness: brightness ?? currentLocal.brightness,
      red: r ?? currentLocal.red,
      green: g ?? currentLocal.green,
      blue: b ?? currentLocal.blue,
    );

    state = state.copyWith(
      localStatus: updatedLocalStatus,
      isInteracting: true,
    );

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 100), () {
      final remoteStatus =
          ref.read(lampStatusProvider(macId)).value ?? LampStatus.initial();

      final int scalingValue = (updatedLocalStatus.brightMode == 1)
          ? updatedLocalStatus.brightness
          : remoteStatus.brightness;

      final statusToSend = updatedLocalStatus.copyWith(
        red: (updatedLocalStatus.red > 0) ? 255 : 0,
        green: (updatedLocalStatus.green > 0) ? 255 : 0,
        blue: (updatedLocalStatus.blue > 0) ? 255 : 0,
        brightness: scalingValue,
      );

      ref
          .read(bleConnectionProvider.notifier)
          .sendLampStatus(macId, statusToSend, description: description);
    });
  }
}
