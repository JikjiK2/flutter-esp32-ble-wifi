import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/repositories/ble_logger.dart';

part 'ble_log_provider.freezed.dart';

part 'ble_log_provider.g.dart';

@freezed
abstract class BleLogState with _$BleLogState {
  const factory BleLogState({
    @Default([]) List<String> commLogs,
    @Default([]) List<String> dataLogs,
  }) = _BleLogState;
}

class BleLoggerAdapter implements BleLogger {
  final BleDataLog notifier;

  BleLoggerAdapter(this.notifier);

  @override
  void logComm(String message) => notifier.addCommLog(message);

  @override
  void logData(String message) => notifier.addDataLog(message);
}

@Riverpod(keepAlive: true)
class BleDataLog extends _$BleDataLog {
  @override
  BleLogState build() => const BleLogState();

  String _getTimestamp() {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  }

  void addCommLog(String message) {
    state = state.copyWith(
      commLogs: ["[${_getTimestamp()}] $message", ...state.commLogs.take(49)],
    );
  }

  void addDataLog(String message) {
    state = state.copyWith(
      dataLogs: ["[${_getTimestamp()}] $message", ...state.dataLogs.take(49)],
    );
  }

  void clearLogs() {
    state = const BleLogState();
  }
}
