// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_device_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncDeviceState {

 List<SyncDeviceEntity> get data;
/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncDeviceStateCopyWith<SyncDeviceState> get copyWith => _$SyncDeviceStateCopyWithImpl<SyncDeviceState>(this as SyncDeviceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncDeviceState&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SyncDeviceState(data: $data)';
}


}

/// @nodoc
abstract mixin class $SyncDeviceStateCopyWith<$Res>  {
  factory $SyncDeviceStateCopyWith(SyncDeviceState value, $Res Function(SyncDeviceState) _then) = _$SyncDeviceStateCopyWithImpl;
@useResult
$Res call({
 List<SyncDeviceEntity> data
});




}
/// @nodoc
class _$SyncDeviceStateCopyWithImpl<$Res>
    implements $SyncDeviceStateCopyWith<$Res> {
  _$SyncDeviceStateCopyWithImpl(this._self, this._then);

  final SyncDeviceState _self;
  final $Res Function(SyncDeviceState) _then;

/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SyncDeviceEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncDeviceState].
extension SyncDeviceStatePatterns on SyncDeviceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _InProgress value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _InProgress value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _InProgress():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _InProgress value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<SyncDeviceEntity> data)?  initial,TResult Function( List<SyncDeviceEntity> data)?  loading,TResult Function( List<SyncDeviceEntity> data)?  success,TResult Function( dynamic error,  List<SyncDeviceEntity> data)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.data);case _InProgress() when loading != null:
return loading(_that.data);case _Success() when success != null:
return success(_that.data);case _Failure() when failure != null:
return failure(_that.error,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<SyncDeviceEntity> data)  initial,required TResult Function( List<SyncDeviceEntity> data)  loading,required TResult Function( List<SyncDeviceEntity> data)  success,required TResult Function( dynamic error,  List<SyncDeviceEntity> data)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.data);case _InProgress():
return loading(_that.data);case _Success():
return success(_that.data);case _Failure():
return failure(_that.error,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<SyncDeviceEntity> data)?  initial,TResult? Function( List<SyncDeviceEntity> data)?  loading,TResult? Function( List<SyncDeviceEntity> data)?  success,TResult? Function( dynamic error,  List<SyncDeviceEntity> data)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.data);case _InProgress() when loading != null:
return loading(_that.data);case _Success() when success != null:
return success(_that.data);case _Failure() when failure != null:
return failure(_that.error,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SyncDeviceState {
  const _Initial({final  List<SyncDeviceEntity> data = const []}): _data = data;
  

 final  List<SyncDeviceEntity> _data;
@override@JsonKey() List<SyncDeviceEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SyncDeviceState.initial(data: $data)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $SyncDeviceStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<SyncDeviceEntity> data
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Initial(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SyncDeviceEntity>,
  ));
}


}

/// @nodoc


class _InProgress implements SyncDeviceState {
  const _InProgress({final  List<SyncDeviceEntity> data = const []}): _data = data;
  

 final  List<SyncDeviceEntity> _data;
@override@JsonKey() List<SyncDeviceEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InProgressCopyWith<_InProgress> get copyWith => __$InProgressCopyWithImpl<_InProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SyncDeviceState.loading(data: $data)';
}


}

/// @nodoc
abstract mixin class _$InProgressCopyWith<$Res> implements $SyncDeviceStateCopyWith<$Res> {
  factory _$InProgressCopyWith(_InProgress value, $Res Function(_InProgress) _then) = __$InProgressCopyWithImpl;
@override @useResult
$Res call({
 List<SyncDeviceEntity> data
});




}
/// @nodoc
class __$InProgressCopyWithImpl<$Res>
    implements _$InProgressCopyWith<$Res> {
  __$InProgressCopyWithImpl(this._self, this._then);

  final _InProgress _self;
  final $Res Function(_InProgress) _then;

/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_InProgress(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SyncDeviceEntity>,
  ));
}


}

/// @nodoc


class _Success implements SyncDeviceState {
  const _Success({required final  List<SyncDeviceEntity> data}): _data = data;
  

 final  List<SyncDeviceEntity> _data;
@override List<SyncDeviceEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SyncDeviceState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $SyncDeviceStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 List<SyncDeviceEntity> data
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Success(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SyncDeviceEntity>,
  ));
}


}

/// @nodoc


class _Failure implements SyncDeviceState {
  const _Failure(this.error, {final  List<SyncDeviceEntity> data = const []}): _data = data;
  

 final  dynamic error;
 final  List<SyncDeviceEntity> _data;
@override@JsonKey() List<SyncDeviceEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SyncDeviceState.failure(error: $error, data: $data)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $SyncDeviceStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@override @useResult
$Res call({
 dynamic error, List<SyncDeviceEntity> data
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of SyncDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? data = null,}) {
  return _then(_Failure(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SyncDeviceEntity>,
  ));
}


}

/// @nodoc
mixin _$SyncDeviceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncDeviceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncDeviceEvent()';
}


}

/// @nodoc
class $SyncDeviceEventCopyWith<$Res>  {
$SyncDeviceEventCopyWith(SyncDeviceEvent _, $Res Function(SyncDeviceEvent) __);
}


/// Adds pattern-matching-related methods to [SyncDeviceEvent].
extension SyncDeviceEventPatterns on SyncDeviceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchLocalDevices value)?  fetchLocalDevices,TResult Function( _FetchRemoteDevices value)?  fetchRemoteDevices,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchLocalDevices() when fetchLocalDevices != null:
return fetchLocalDevices(_that);case _FetchRemoteDevices() when fetchRemoteDevices != null:
return fetchRemoteDevices(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchLocalDevices value)  fetchLocalDevices,required TResult Function( _FetchRemoteDevices value)  fetchRemoteDevices,}){
final _that = this;
switch (_that) {
case _FetchLocalDevices():
return fetchLocalDevices(_that);case _FetchRemoteDevices():
return fetchRemoteDevices(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchLocalDevices value)?  fetchLocalDevices,TResult? Function( _FetchRemoteDevices value)?  fetchRemoteDevices,}){
final _that = this;
switch (_that) {
case _FetchLocalDevices() when fetchLocalDevices != null:
return fetchLocalDevices(_that);case _FetchRemoteDevices() when fetchRemoteDevices != null:
return fetchRemoteDevices(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchLocalDevices,TResult Function()?  fetchRemoteDevices,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchLocalDevices() when fetchLocalDevices != null:
return fetchLocalDevices();case _FetchRemoteDevices() when fetchRemoteDevices != null:
return fetchRemoteDevices();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchLocalDevices,required TResult Function()  fetchRemoteDevices,}) {final _that = this;
switch (_that) {
case _FetchLocalDevices():
return fetchLocalDevices();case _FetchRemoteDevices():
return fetchRemoteDevices();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchLocalDevices,TResult? Function()?  fetchRemoteDevices,}) {final _that = this;
switch (_that) {
case _FetchLocalDevices() when fetchLocalDevices != null:
return fetchLocalDevices();case _FetchRemoteDevices() when fetchRemoteDevices != null:
return fetchRemoteDevices();case _:
  return null;

}
}

}

/// @nodoc


class _FetchLocalDevices implements SyncDeviceEvent {
   _FetchLocalDevices();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchLocalDevices);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncDeviceEvent.fetchLocalDevices()';
}


}




/// @nodoc


class _FetchRemoteDevices implements SyncDeviceEvent {
   _FetchRemoteDevices();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchRemoteDevices);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncDeviceEvent.fetchRemoteDevices()';
}


}




// dart format on
