// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lamp_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LampStatusModel _$LampStatusModelFromJson(Map<String, dynamic> json) =>
    _LampStatusModel(
      temperature: (json['temp'] as num).toDouble(),
      humidity: (json['hum'] as num).toDouble(),
      brightness: (json['brightness'] as num).toInt(),
      brightMode: (json['brightMode'] as num).toInt(),
      ledMode: (json['ledMode'] as num).toInt(),
      red: (json['r'] as num).toInt(),
      green: (json['g'] as num).toInt(),
      blue: (json['b'] as num).toInt(),
    );

Map<String, dynamic> _$LampStatusModelToJson(_LampStatusModel instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'hum': instance.humidity,
      'brightness': instance.brightness,
      'brightMode': instance.brightMode,
      'ledMode': instance.ledMode,
      'r': instance.red,
      'g': instance.green,
      'b': instance.blue,
    };
