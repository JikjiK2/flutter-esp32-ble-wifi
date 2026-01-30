// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_log_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleLogState {

 List<String> get commLogs; List<String> get dataLogs;
/// Create a copy of BleLogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleLogStateCopyWith<BleLogState> get copyWith => _$BleLogStateCopyWithImpl<BleLogState>(this as BleLogState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleLogState&&const DeepCollectionEquality().equals(other.commLogs, commLogs)&&const DeepCollectionEquality().equals(other.dataLogs, dataLogs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(commLogs),const DeepCollectionEquality().hash(dataLogs));

@override
String toString() {
  return 'BleLogState(commLogs: $commLogs, dataLogs: $dataLogs)';
}


}

/// @nodoc
abstract mixin class $BleLogStateCopyWith<$Res>  {
  factory $BleLogStateCopyWith(BleLogState value, $Res Function(BleLogState) _then) = _$BleLogStateCopyWithImpl;
@useResult
$Res call({
 List<String> commLogs, List<String> dataLogs
});




}
/// @nodoc
class _$BleLogStateCopyWithImpl<$Res>
    implements $BleLogStateCopyWith<$Res> {
  _$BleLogStateCopyWithImpl(this._self, this._then);

  final BleLogState _self;
  final $Res Function(BleLogState) _then;

/// Create a copy of BleLogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commLogs = null,Object? dataLogs = null,}) {
  return _then(_self.copyWith(
commLogs: null == commLogs ? _self.commLogs : commLogs // ignore: cast_nullable_to_non_nullable
as List<String>,dataLogs: null == dataLogs ? _self.dataLogs : dataLogs // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BleLogState].
extension BleLogStatePatterns on BleLogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleLogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleLogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleLogState value)  $default,){
final _that = this;
switch (_that) {
case _BleLogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleLogState value)?  $default,){
final _that = this;
switch (_that) {
case _BleLogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> commLogs,  List<String> dataLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleLogState() when $default != null:
return $default(_that.commLogs,_that.dataLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> commLogs,  List<String> dataLogs)  $default,) {final _that = this;
switch (_that) {
case _BleLogState():
return $default(_that.commLogs,_that.dataLogs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> commLogs,  List<String> dataLogs)?  $default,) {final _that = this;
switch (_that) {
case _BleLogState() when $default != null:
return $default(_that.commLogs,_that.dataLogs);case _:
  return null;

}
}

}

/// @nodoc


class _BleLogState implements BleLogState {
  const _BleLogState({final  List<String> commLogs = const [], final  List<String> dataLogs = const []}): _commLogs = commLogs,_dataLogs = dataLogs;
  

 final  List<String> _commLogs;
@override@JsonKey() List<String> get commLogs {
  if (_commLogs is EqualUnmodifiableListView) return _commLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commLogs);
}

 final  List<String> _dataLogs;
@override@JsonKey() List<String> get dataLogs {
  if (_dataLogs is EqualUnmodifiableListView) return _dataLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataLogs);
}


/// Create a copy of BleLogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleLogStateCopyWith<_BleLogState> get copyWith => __$BleLogStateCopyWithImpl<_BleLogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleLogState&&const DeepCollectionEquality().equals(other._commLogs, _commLogs)&&const DeepCollectionEquality().equals(other._dataLogs, _dataLogs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_commLogs),const DeepCollectionEquality().hash(_dataLogs));

@override
String toString() {
  return 'BleLogState(commLogs: $commLogs, dataLogs: $dataLogs)';
}


}

/// @nodoc
abstract mixin class _$BleLogStateCopyWith<$Res> implements $BleLogStateCopyWith<$Res> {
  factory _$BleLogStateCopyWith(_BleLogState value, $Res Function(_BleLogState) _then) = __$BleLogStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> commLogs, List<String> dataLogs
});




}
/// @nodoc
class __$BleLogStateCopyWithImpl<$Res>
    implements _$BleLogStateCopyWith<$Res> {
  __$BleLogStateCopyWithImpl(this._self, this._then);

  final _BleLogState _self;
  final $Res Function(_BleLogState) _then;

/// Create a copy of BleLogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commLogs = null,Object? dataLogs = null,}) {
  return _then(_BleLogState(
commLogs: null == commLogs ? _self._commLogs : commLogs // ignore: cast_nullable_to_non_nullable
as List<String>,dataLogs: null == dataLogs ? _self._dataLogs : dataLogs // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
