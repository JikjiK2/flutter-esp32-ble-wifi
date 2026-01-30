// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lamp_status_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LampStatus {

 int get brightness; int get brightMode; int get red; int get green; int get blue; double get temperature; double get humidity; int get ledMode;
/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LampStatusCopyWith<LampStatus> get copyWith => _$LampStatusCopyWithImpl<LampStatus>(this as LampStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LampStatus&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.red, red) || other.red == red)&&(identical(other.green, green) || other.green == green)&&(identical(other.blue, blue) || other.blue == blue)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode));
}


@override
int get hashCode => Object.hash(runtimeType,brightness,brightMode,red,green,blue,temperature,humidity,ledMode);

@override
String toString() {
  return 'LampStatus(brightness: $brightness, brightMode: $brightMode, red: $red, green: $green, blue: $blue, temperature: $temperature, humidity: $humidity, ledMode: $ledMode)';
}


}

/// @nodoc
abstract mixin class $LampStatusCopyWith<$Res>  {
  factory $LampStatusCopyWith(LampStatus value, $Res Function(LampStatus) _then) = _$LampStatusCopyWithImpl;
@useResult
$Res call({
 int brightness, int brightMode, int red, int green, int blue, double temperature, double humidity, int ledMode
});




}
/// @nodoc
class _$LampStatusCopyWithImpl<$Res>
    implements $LampStatusCopyWith<$Res> {
  _$LampStatusCopyWithImpl(this._self, this._then);

  final LampStatus _self;
  final $Res Function(LampStatus) _then;

/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brightness = null,Object? brightMode = null,Object? red = null,Object? green = null,Object? blue = null,Object? temperature = null,Object? humidity = null,Object? ledMode = null,}) {
  return _then(_self.copyWith(
brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int,brightMode: null == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int,red: null == red ? _self.red : red // ignore: cast_nullable_to_non_nullable
as int,green: null == green ? _self.green : green // ignore: cast_nullable_to_non_nullable
as int,blue: null == blue ? _self.blue : blue // ignore: cast_nullable_to_non_nullable
as int,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,ledMode: null == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LampStatus].
extension LampStatusPatterns on LampStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LampStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LampStatus value)  $default,){
final _that = this;
switch (_that) {
case _LampStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LampStatus value)?  $default,){
final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int brightness,  int brightMode,  int red,  int green,  int blue,  double temperature,  double humidity,  int ledMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
return $default(_that.brightness,_that.brightMode,_that.red,_that.green,_that.blue,_that.temperature,_that.humidity,_that.ledMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int brightness,  int brightMode,  int red,  int green,  int blue,  double temperature,  double humidity,  int ledMode)  $default,) {final _that = this;
switch (_that) {
case _LampStatus():
return $default(_that.brightness,_that.brightMode,_that.red,_that.green,_that.blue,_that.temperature,_that.humidity,_that.ledMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int brightness,  int brightMode,  int red,  int green,  int blue,  double temperature,  double humidity,  int ledMode)?  $default,) {final _that = this;
switch (_that) {
case _LampStatus() when $default != null:
return $default(_that.brightness,_that.brightMode,_that.red,_that.green,_that.blue,_that.temperature,_that.humidity,_that.ledMode);case _:
  return null;

}
}

}

/// @nodoc


class _LampStatus extends LampStatus {
  const _LampStatus({required this.brightness, required this.brightMode, required this.red, required this.green, required this.blue, required this.temperature, required this.humidity, required this.ledMode}): super._();
  

@override final  int brightness;
@override final  int brightMode;
@override final  int red;
@override final  int green;
@override final  int blue;
@override final  double temperature;
@override final  double humidity;
@override final  int ledMode;

/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LampStatusCopyWith<_LampStatus> get copyWith => __$LampStatusCopyWithImpl<_LampStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LampStatus&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.brightMode, brightMode) || other.brightMode == brightMode)&&(identical(other.red, red) || other.red == red)&&(identical(other.green, green) || other.green == green)&&(identical(other.blue, blue) || other.blue == blue)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.ledMode, ledMode) || other.ledMode == ledMode));
}


@override
int get hashCode => Object.hash(runtimeType,brightness,brightMode,red,green,blue,temperature,humidity,ledMode);

@override
String toString() {
  return 'LampStatus(brightness: $brightness, brightMode: $brightMode, red: $red, green: $green, blue: $blue, temperature: $temperature, humidity: $humidity, ledMode: $ledMode)';
}


}

/// @nodoc
abstract mixin class _$LampStatusCopyWith<$Res> implements $LampStatusCopyWith<$Res> {
  factory _$LampStatusCopyWith(_LampStatus value, $Res Function(_LampStatus) _then) = __$LampStatusCopyWithImpl;
@override @useResult
$Res call({
 int brightness, int brightMode, int red, int green, int blue, double temperature, double humidity, int ledMode
});




}
/// @nodoc
class __$LampStatusCopyWithImpl<$Res>
    implements _$LampStatusCopyWith<$Res> {
  __$LampStatusCopyWithImpl(this._self, this._then);

  final _LampStatus _self;
  final $Res Function(_LampStatus) _then;

/// Create a copy of LampStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brightness = null,Object? brightMode = null,Object? red = null,Object? green = null,Object? blue = null,Object? temperature = null,Object? humidity = null,Object? ledMode = null,}) {
  return _then(_LampStatus(
brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as int,brightMode: null == brightMode ? _self.brightMode : brightMode // ignore: cast_nullable_to_non_nullable
as int,red: null == red ? _self.red : red // ignore: cast_nullable_to_non_nullable
as int,green: null == green ? _self.green : green // ignore: cast_nullable_to_non_nullable
as int,blue: null == blue ? _self.blue : blue // ignore: cast_nullable_to_non_nullable
as int,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,ledMode: null == ledMode ? _self.ledMode : ledMode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
