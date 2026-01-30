import 'package:freezed_annotation/freezed_annotation.dart';

part 'lamp_status_entity.freezed.dart';

@freezed
abstract class LampStatus with _$LampStatus {
  const LampStatus._();

  const factory LampStatus({
    required int brightness,
    required int brightMode,
    required int red,
    required int green,
    required int blue,
    required double temperature,
    required double humidity,
    required int ledMode,
  }) = _LampStatus;

  static LampStatus initial() {
    return const LampStatus(
      brightness: 0,
      brightMode: 0,
      red: 0,
      green: 0,
      blue: 0,
      temperature: 0.0,
      humidity: 0.0,
      ledMode: 0,
    );
  }

  // 💡 도메인 로직: 온도에 따른 상태 설명 반환
  String get weatherColorDescription {
    if (temperature <= 18) return "추움 (파란색)";
    if (temperature <= 28) return "적당함 (초록색)";
    return "더움 (빨간색)";
  }
}
