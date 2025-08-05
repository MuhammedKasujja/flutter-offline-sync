// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_configuration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceConfigurationState {

 DeviceConfigStep get configStep;
/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceConfigurationStateCopyWith<DeviceConfigurationState> get copyWith => _$DeviceConfigurationStateCopyWithImpl<DeviceConfigurationState>(this as DeviceConfigurationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceConfigurationState&&(identical(other.configStep, configStep) || other.configStep == configStep));
}


@override
int get hashCode => Object.hash(runtimeType,configStep);

@override
String toString() {
  return 'DeviceConfigurationState(configStep: $configStep)';
}


}

/// @nodoc
abstract mixin class $DeviceConfigurationStateCopyWith<$Res>  {
  factory $DeviceConfigurationStateCopyWith(DeviceConfigurationState value, $Res Function(DeviceConfigurationState) _then) = _$DeviceConfigurationStateCopyWithImpl;
@useResult
$Res call({
 DeviceConfigStep configStep
});




}
/// @nodoc
class _$DeviceConfigurationStateCopyWithImpl<$Res>
    implements $DeviceConfigurationStateCopyWith<$Res> {
  _$DeviceConfigurationStateCopyWithImpl(this._self, this._then);

  final DeviceConfigurationState _self;
  final $Res Function(DeviceConfigurationState) _then;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? configStep = null,}) {
  return _then(_self.copyWith(
configStep: null == configStep ? _self.configStep : configStep // ignore: cast_nullable_to_non_nullable
as DeviceConfigStep,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceConfigurationState].
extension DeviceConfigurationStatePatterns on DeviceConfigurationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadInProgress value)?  loading,TResult Function( _Sucessfully value)?  success,TResult Function( _Failure value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _Sucessfully() when success != null:
return success(_that);case _Failure() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadInProgress value)  loading,required TResult Function( _Sucessfully value)  success,required TResult Function( _Failure value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadInProgress():
return loading(_that);case _Sucessfully():
return success(_that);case _Failure():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadInProgress value)?  loading,TResult? Function( _Sucessfully value)?  success,TResult? Function( _Failure value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _Sucessfully() when success != null:
return success(_that);case _Failure() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DeviceConfigStep configStep)?  initial,TResult Function( DeviceConfigStep configStep)?  loading,TResult Function( String? message,  DeviceConfigStep configStep)?  success,TResult Function( DeviceConfigStep configStep,  dynamic error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.configStep);case _LoadInProgress() when loading != null:
return loading(_that.configStep);case _Sucessfully() when success != null:
return success(_that.message,_that.configStep);case _Failure() when error != null:
return error(_that.configStep,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DeviceConfigStep configStep)  initial,required TResult Function( DeviceConfigStep configStep)  loading,required TResult Function( String? message,  DeviceConfigStep configStep)  success,required TResult Function( DeviceConfigStep configStep,  dynamic error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.configStep);case _LoadInProgress():
return loading(_that.configStep);case _Sucessfully():
return success(_that.message,_that.configStep);case _Failure():
return error(_that.configStep,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DeviceConfigStep configStep)?  initial,TResult? Function( DeviceConfigStep configStep)?  loading,TResult? Function( String? message,  DeviceConfigStep configStep)?  success,TResult? Function( DeviceConfigStep configStep,  dynamic error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.configStep);case _LoadInProgress() when loading != null:
return loading(_that.configStep);case _Sucessfully() when success != null:
return success(_that.message,_that.configStep);case _Failure() when error != null:
return error(_that.configStep,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DeviceConfigurationState {
  const _Initial({required this.configStep});
  

@override final  DeviceConfigStep configStep;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.configStep, configStep) || other.configStep == configStep));
}


@override
int get hashCode => Object.hash(runtimeType,configStep);

@override
String toString() {
  return 'DeviceConfigurationState.initial(configStep: $configStep)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $DeviceConfigurationStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 DeviceConfigStep configStep
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configStep = null,}) {
  return _then(_Initial(
configStep: null == configStep ? _self.configStep : configStep // ignore: cast_nullable_to_non_nullable
as DeviceConfigStep,
  ));
}


}

/// @nodoc


class _LoadInProgress implements DeviceConfigurationState {
  const _LoadInProgress({required this.configStep});
  

@override final  DeviceConfigStep configStep;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadInProgressCopyWith<_LoadInProgress> get copyWith => __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInProgress&&(identical(other.configStep, configStep) || other.configStep == configStep));
}


@override
int get hashCode => Object.hash(runtimeType,configStep);

@override
String toString() {
  return 'DeviceConfigurationState.loading(configStep: $configStep)';
}


}

/// @nodoc
abstract mixin class _$LoadInProgressCopyWith<$Res> implements $DeviceConfigurationStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(_LoadInProgress value, $Res Function(_LoadInProgress) _then) = __$LoadInProgressCopyWithImpl;
@override @useResult
$Res call({
 DeviceConfigStep configStep
});




}
/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(this._self, this._then);

  final _LoadInProgress _self;
  final $Res Function(_LoadInProgress) _then;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configStep = null,}) {
  return _then(_LoadInProgress(
configStep: null == configStep ? _self.configStep : configStep // ignore: cast_nullable_to_non_nullable
as DeviceConfigStep,
  ));
}


}

/// @nodoc


class _Sucessfully implements DeviceConfigurationState {
  const _Sucessfully({this.message, required this.configStep});
  

 final  String? message;
@override final  DeviceConfigStep configStep;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SucessfullyCopyWith<_Sucessfully> get copyWith => __$SucessfullyCopyWithImpl<_Sucessfully>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sucessfully&&(identical(other.message, message) || other.message == message)&&(identical(other.configStep, configStep) || other.configStep == configStep));
}


@override
int get hashCode => Object.hash(runtimeType,message,configStep);

@override
String toString() {
  return 'DeviceConfigurationState.success(message: $message, configStep: $configStep)';
}


}

/// @nodoc
abstract mixin class _$SucessfullyCopyWith<$Res> implements $DeviceConfigurationStateCopyWith<$Res> {
  factory _$SucessfullyCopyWith(_Sucessfully value, $Res Function(_Sucessfully) _then) = __$SucessfullyCopyWithImpl;
@override @useResult
$Res call({
 String? message, DeviceConfigStep configStep
});




}
/// @nodoc
class __$SucessfullyCopyWithImpl<$Res>
    implements _$SucessfullyCopyWith<$Res> {
  __$SucessfullyCopyWithImpl(this._self, this._then);

  final _Sucessfully _self;
  final $Res Function(_Sucessfully) _then;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? configStep = null,}) {
  return _then(_Sucessfully(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,configStep: null == configStep ? _self.configStep : configStep // ignore: cast_nullable_to_non_nullable
as DeviceConfigStep,
  ));
}


}

/// @nodoc


class _Failure implements DeviceConfigurationState {
  const _Failure({required this.configStep, this.error});
  

@override final  DeviceConfigStep configStep;
 final  dynamic error;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.configStep, configStep) || other.configStep == configStep)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,configStep,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'DeviceConfigurationState.error(configStep: $configStep, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $DeviceConfigurationStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@override @useResult
$Res call({
 DeviceConfigStep configStep, dynamic error
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of DeviceConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configStep = null,Object? error = freezed,}) {
  return _then(_Failure(
configStep: null == configStep ? _self.configStep : configStep // ignore: cast_nullable_to_non_nullable
as DeviceConfigStep,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$DeviceConfigurationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceConfigurationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeviceConfigurationEvent()';
}


}

/// @nodoc
class $DeviceConfigurationEventCopyWith<$Res>  {
$DeviceConfigurationEventCopyWith(DeviceConfigurationEvent _, $Res Function(DeviceConfigurationEvent) __);
}


/// Adds pattern-matching-related methods to [DeviceConfigurationEvent].
extension DeviceConfigurationEventPatterns on DeviceConfigurationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterDevice value)?  registerDevice,TResult Function( _ShowSyncRemoteUpdates value)?  showSyncRemoteUpdates,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterDevice() when registerDevice != null:
return registerDevice(_that);case _ShowSyncRemoteUpdates() when showSyncRemoteUpdates != null:
return showSyncRemoteUpdates(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterDevice value)  registerDevice,required TResult Function( _ShowSyncRemoteUpdates value)  showSyncRemoteUpdates,}){
final _that = this;
switch (_that) {
case RegisterDevice():
return registerDevice(_that);case _ShowSyncRemoteUpdates():
return showSyncRemoteUpdates(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterDevice value)?  registerDevice,TResult? Function( _ShowSyncRemoteUpdates value)?  showSyncRemoteUpdates,}){
final _that = this;
switch (_that) {
case RegisterDevice() when registerDevice != null:
return registerDevice(_that);case _ShowSyncRemoteUpdates() when showSyncRemoteUpdates != null:
return showSyncRemoteUpdates(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SyncDeviceRequest requestDetails)?  registerDevice,TResult Function()?  showSyncRemoteUpdates,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterDevice() when registerDevice != null:
return registerDevice(_that.requestDetails);case _ShowSyncRemoteUpdates() when showSyncRemoteUpdates != null:
return showSyncRemoteUpdates();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SyncDeviceRequest requestDetails)  registerDevice,required TResult Function()  showSyncRemoteUpdates,}) {final _that = this;
switch (_that) {
case RegisterDevice():
return registerDevice(_that.requestDetails);case _ShowSyncRemoteUpdates():
return showSyncRemoteUpdates();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SyncDeviceRequest requestDetails)?  registerDevice,TResult? Function()?  showSyncRemoteUpdates,}) {final _that = this;
switch (_that) {
case RegisterDevice() when registerDevice != null:
return registerDevice(_that.requestDetails);case _ShowSyncRemoteUpdates() when showSyncRemoteUpdates != null:
return showSyncRemoteUpdates();case _:
  return null;

}
}

}

/// @nodoc


class RegisterDevice implements DeviceConfigurationEvent {
   RegisterDevice(this.requestDetails);
  

 final  SyncDeviceRequest requestDetails;

/// Create a copy of DeviceConfigurationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDeviceCopyWith<RegisterDevice> get copyWith => _$RegisterDeviceCopyWithImpl<RegisterDevice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterDevice&&(identical(other.requestDetails, requestDetails) || other.requestDetails == requestDetails));
}


@override
int get hashCode => Object.hash(runtimeType,requestDetails);

@override
String toString() {
  return 'DeviceConfigurationEvent.registerDevice(requestDetails: $requestDetails)';
}


}

/// @nodoc
abstract mixin class $RegisterDeviceCopyWith<$Res> implements $DeviceConfigurationEventCopyWith<$Res> {
  factory $RegisterDeviceCopyWith(RegisterDevice value, $Res Function(RegisterDevice) _then) = _$RegisterDeviceCopyWithImpl;
@useResult
$Res call({
 SyncDeviceRequest requestDetails
});




}
/// @nodoc
class _$RegisterDeviceCopyWithImpl<$Res>
    implements $RegisterDeviceCopyWith<$Res> {
  _$RegisterDeviceCopyWithImpl(this._self, this._then);

  final RegisterDevice _self;
  final $Res Function(RegisterDevice) _then;

/// Create a copy of DeviceConfigurationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestDetails = null,}) {
  return _then(RegisterDevice(
null == requestDetails ? _self.requestDetails : requestDetails // ignore: cast_nullable_to_non_nullable
as SyncDeviceRequest,
  ));
}


}

/// @nodoc


class _ShowSyncRemoteUpdates implements DeviceConfigurationEvent {
   _ShowSyncRemoteUpdates();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowSyncRemoteUpdates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeviceConfigurationEvent.showSyncRemoteUpdates()';
}


}




// dart format on
