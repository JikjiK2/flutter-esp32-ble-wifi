// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lamp_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LampStatusModel {

@JsonKey(name: 'temp') double get temperature;@JsonKey(name: 'hum') double get humidity;@JsonKey(name: 'brightness') int get brightness;@JsonKey(name: 'brightMode') int get brightMode;@JsonKey(name: 'ledMode') int get ledMode;@JsonKey(name: 'r') int get red;@JsonKey(name: 'g') int get green;@JsonKey(name: 'b') int get blue;
/// Create a copy of LampStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LampStatusModelCopyWith<LampStatusModel> get copyWith => _$LampStatusModelCopyWithImpl<LampStatusModel>(this as LampStatusModel, _$identity);

  /// Serializes this LampStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LampStatusModel&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode)&&(identical(other.red, red) || other.red == red)&&(identical(other.green, green) || other.green == green)&&(identical(other.blue, blue) || other.blue == blue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,humidity,brightness,brightMode,ledMode,red,green,blue);

@override
String toString() {
  return 'LampStatusModel(temperature: $temperature, humidity: $humidity, brightness: $brightness, brightMode: $brightMode, ledMode: $ledMode, red: $red, green: $green, blue: $blue)';
}


}

/// @nodoc
abstract mixin class $LampStatusModelCopyWith<$Res>  {
  factory $LampStatusModelCopyWith(LampStatusModel value, $Res Function(LampStatusModel) _then) = _$LampStatusModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'temp') double temperature,@JsonKey(name: 'hum') double humidity,@JsonKey(name: 'brightness') int brightness,@JsonKey(name: 'brightMode') int brightMode,@JsonKey(name: 'ledMode') int ledMode,@JsonKey(name: 'r') int red,@JsonKey(name: 'g') int green,@JsonKey(name: 'b') int blue
});




}
/// @nodoc
class _$LampStatusModelCopyWithImpl<$Res>
    implements $LampStatusModelCopyWith<$Res> {
  _$LampStatusModelCopyWithImpl(this._self, this._then);

  final LampStatusModel _self;
  final $Res Function(LampStatusModel) _then;

/// Create a copy of LampStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temperature = null,Object? humidity = null,Object? brightness = null,Object? brightMode = null,Object? ledMode = null,Object? red = null,Object? green = null,Object? blue = null,}) {
  return _then(_self.copyWith(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int,brightMode: null == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int,ledMode: null == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int,red: null == red ? _self.red : red // ignore: cast_nullable_to_non_nullable
as int,green: null == green ? _self.green : green // ignore: cast_nullable_to_non_nullable
as int,blue: null == blue ? _self.blue : blue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LampStatusModel].
extension LampStatusModelPatterns on LampStatusModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LampStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LampStatusModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LampStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _LampStatusModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LampStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _LampStatusModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'hum')  double humidity, @JsonKey(name: 'brightness')  int brightness, @JsonKey(name: 'brightMode')  int brightMode, @JsonKey(name: 'ledMode')  int ledMode, @JsonKey(name: 'r')  int red, @JsonKey(name: 'g')  int green, @JsonKey(name: 'b')  int blue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LampStatusModel() when $default != null:
return $default(_that.temperature,_that.humidity,_that.brightness,_that.brightMode,_that.ledMode,_that.red,_that.green,_that.blue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'hum')  double humidity, @JsonKey(name: 'brightness')  int brightness, @JsonKey(name: 'brightMode')  int brightMode, @JsonKey(name: 'ledMode')  int ledMode, @JsonKey(name: 'r')  int red, @JsonKey(name: 'g')  int green, @JsonKey(name: 'b')  int blue)  $default,) {final _that = this;
switch (_that) {
case _LampStatusModel():
return $default(_that.temperature,_that.humidity,_that.brightness,_that.brightMode,_that.ledMode,_that.red,_that.green,_that.blue);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'temp')  double temperature, @JsonKey(name: 'hum')  double humidity, @JsonKey(name: 'brightness')  int brightness, @JsonKey(name: 'brightMode')  int brightMode, @JsonKey(name: 'ledMode')  int ledMode, @JsonKey(name: 'r')  int red, @JsonKey(name: 'g')  int green, @JsonKey(name: 'b')  int blue)?  $default,) {final _that = this;
switch (_that) {
case _LampStatusModel() when $default != null:
return $default(_that.temperature,_that.humidity,_that.brightness,_that.brightMode,_that.ledMode,_that.red,_that.green,_that.blue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LampStatusModel extends LampStatusModel {
  const _LampStatusModel({@JsonKey(name: 'temp') required this.temperature, @JsonKey(name: 'hum') required this.humidity, @JsonKey(name: 'brightness') required this.brightness, @JsonKey(name: 'brightMode') required this.brightMode, @JsonKey(name: 'ledMode') required this.ledMode, @JsonKey(name: 'r') required this.red, @JsonKey(name: 'g') required this.green, @JsonKey(name: 'b') required this.blue}): super._();
  factory _LampStatusModel.fromJson(Map<String, dynamic> json) => _$LampStatusModelFromJson(json);

@override@JsonKey(name: 'temp') final  double temperature;
@override@JsonKey(name: 'hum') final  double humidity;
@override@JsonKey(name: 'brightness') final  int brightness;
@override@JsonKey(name: 'brightMode') final  int brightMode;
@override@JsonKey(name: 'ledMode') final  int ledMode;
@override@JsonKey(name: 'r') final  int red;
@override@JsonKey(name: 'g') final  int green;
@override@JsonKey(name: 'b') final  int blue;

/// Create a copy of LampStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LampStatusModelCopyWith<_LampStatusModel> get copyWith => __$LampStatusModelCopyWithImpl<_LampStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LampStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LampStatusModel&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode)&&(identical(other.red, red) || other.red == red)&&(identical(other.green, green) || other.green == green)&&(identical(other.blue, blue) || other.blue == blue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temperature,humidity,brightness,brightMode,ledMode,red,green,blue);

@override
String toString() {
  return 'LampStatusModel(temperature: $temperature, humidity: $humidity, brightness: $brightness, brightMode: $brightMode, ledMode: $ledMode, red: $red, green: $green, blue: $blue)';
}


}

/// @nodoc
abstract mixin class _$LampStatusModelCopyWith<$Res> implements $LampStatusModelCopyWith<$Res> {
  factory _$LampStatusModelCopyWith(_LampStatusModel value, $Res Function(_LampStatusModel) _then) = __$LampStatusModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'temp') double temperature,@JsonKey(name: 'hum') double humidity,@JsonKey(name: 'brightness') int brightness,@JsonKey(name: 'brightMode') int brightMode,@JsonKey(name: 'ledMode') int ledMode,@JsonKey(name: 'r') int red,@JsonKey(name: 'g') int green,@JsonKey(name: 'b') int blue
});




}
/// @nodoc
class __$LampStatusModelCopyWithImpl<$Res>
    implements _$LampStatusModelCopyWith<$Res> {
  __$LampStatusModelCopyWithImpl(this._self, this._then);

  final _LampStatusModel _self;
  final $Res Function(_LampStatusModel) _then;

/// Create a copy of LampStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temperature = null,Object? humidity = null,Object? brightness = null,Object? brightMode = null,Object? ledMode = null,Object? red = null,Object? green = null,Object? blue = null,}) {
  return _then(_LampStatusModel(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int,brightMode: null == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int,ledMode: null == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int,red: null == red ? _self.red : red // ignore: cast_nullable_to_non_nullable
as int,green: null == green ? _self.green : green // ignore: cast_nullable_to_non_nullable
as int,blue: null == blue ? _self.blue : blue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
