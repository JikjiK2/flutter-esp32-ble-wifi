import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/lamp_status_entity.dart';

part 'lamp_status_model.freezed.dart';
part 'lamp_status_model.g.dart';

@freezed
 abstract class LampStatusModel with _$LampStatusModel {
  const LampStatusModel._();

  const factory LampStatusModel({
    @JsonKey(name: 'temp') required double temperature,
    @JsonKey(name: 'hum') required double humidity,
    @JsonKey(name: 'brightness') required int brightness,
    @JsonKey(name: 'brightMode') required int brightMode,
    @JsonKey(name: 'ledMode') required int ledMode,
    @JsonKey(name: 'r') required int red,
    @JsonKey(name: 'g') required int green,
    @JsonKey(name: 'b') required int blue,
  }) = _LampStatusModel;

  factory LampStatusModel.fromJson(Map<String, dynamic> json) => _$LampStatusModelFromJson(json);

  LampStatus toEntity() {
    return LampStatus(
      temperature: temperature,
      humidity: humidity,
      brightness: brightness,
      brightMode: brightMode,
      ledMode: ledMode,
      red: red,
      green: green,
      blue: blue,
    );
  }
}