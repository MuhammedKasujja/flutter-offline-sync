// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_update_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncUpdateState {

 List<DataEntity> get remoteUpdates;
/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncUpdateStateCopyWith<SyncUpdateState> get copyWith => _$SyncUpdateStateCopyWithImpl<SyncUpdateState>(this as SyncUpdateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncUpdateState&&const DeepCollectionEquality().equals(other.remoteUpdates, remoteUpdates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(remoteUpdates));

@override
String toString() {
  return 'SyncUpdateState(remoteUpdates: $remoteUpdates)';
}


}

/// @nodoc
abstract mixin class $SyncUpdateStateCopyWith<$Res>  {
  factory $SyncUpdateStateCopyWith(SyncUpdateState value, $Res Function(SyncUpdateState) _then) = _$SyncUpdateStateCopyWithImpl;
@useResult
$Res call({
 List<DataEntity> remoteUpdates
});




}
/// @nodoc
class _$SyncUpdateStateCopyWithImpl<$Res>
    implements $SyncUpdateStateCopyWith<$Res> {
  _$SyncUpdateStateCopyWithImpl(this._self, this._then);

  final SyncUpdateState _self;
  final $Res Function(SyncUpdateState) _then;

/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteUpdates = null,}) {
  return _then(_self.copyWith(
remoteUpdates: null == remoteUpdates ? _self.remoteUpdates : remoteUpdates // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,
  ));
}

}


/// @nodoc


class _Initial implements SyncUpdateState {
  const _Initial({required final  List<DataEntity> remoteUpdates}): _remoteUpdates = remoteUpdates;
  

 final  List<DataEntity> _remoteUpdates;
@override List<DataEntity> get remoteUpdates {
  if (_remoteUpdates is EqualUnmodifiableListView) return _remoteUpdates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remoteUpdates);
}


/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._remoteUpdates, _remoteUpdates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_remoteUpdates));

@override
String toString() {
  return 'SyncUpdateState.initial(remoteUpdates: $remoteUpdates)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $SyncUpdateStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<DataEntity> remoteUpdates
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteUpdates = null,}) {
  return _then(_Initial(
remoteUpdates: null == remoteUpdates ? _self._remoteUpdates : remoteUpdates // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,
  ));
}


}

/// @nodoc


class _LoadInProgress implements SyncUpdateState {
  const _LoadInProgress({required final  List<DataEntity> remoteUpdates}): _remoteUpdates = remoteUpdates;
  

 final  List<DataEntity> _remoteUpdates;
@override List<DataEntity> get remoteUpdates {
  if (_remoteUpdates is EqualUnmodifiableListView) return _remoteUpdates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remoteUpdates);
}


/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadInProgressCopyWith<_LoadInProgress> get copyWith => __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInProgress&&const DeepCollectionEquality().equals(other._remoteUpdates, _remoteUpdates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_remoteUpdates));

@override
String toString() {
  return 'SyncUpdateState.loading(remoteUpdates: $remoteUpdates)';
}


}

/// @nodoc
abstract mixin class _$LoadInProgressCopyWith<$Res> implements $SyncUpdateStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(_LoadInProgress value, $Res Function(_LoadInProgress) _then) = __$LoadInProgressCopyWithImpl;
@override @useResult
$Res call({
 List<DataEntity> remoteUpdates
});




}
/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(this._self, this._then);

  final _LoadInProgress _self;
  final $Res Function(_LoadInProgress) _then;

/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteUpdates = null,}) {
  return _then(_LoadInProgress(
remoteUpdates: null == remoteUpdates ? _self._remoteUpdates : remoteUpdates // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,
  ));
}


}

/// @nodoc


class _SyncUpdateSucessfully implements SyncUpdateState {
  const _SyncUpdateSucessfully({this.message, required final  List<DataEntity> remoteUpdates}): _remoteUpdates = remoteUpdates;
  

 final  String? message;
 final  List<DataEntity> _remoteUpdates;
@override List<DataEntity> get remoteUpdates {
  if (_remoteUpdates is EqualUnmodifiableListView) return _remoteUpdates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remoteUpdates);
}


/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncUpdateSucessfullyCopyWith<_SyncUpdateSucessfully> get copyWith => __$SyncUpdateSucessfullyCopyWithImpl<_SyncUpdateSucessfully>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncUpdateSucessfully&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._remoteUpdates, _remoteUpdates));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_remoteUpdates));

@override
String toString() {
  return 'SyncUpdateState.success(message: $message, remoteUpdates: $remoteUpdates)';
}


}

/// @nodoc
abstract mixin class _$SyncUpdateSucessfullyCopyWith<$Res> implements $SyncUpdateStateCopyWith<$Res> {
  factory _$SyncUpdateSucessfullyCopyWith(_SyncUpdateSucessfully value, $Res Function(_SyncUpdateSucessfully) _then) = __$SyncUpdateSucessfullyCopyWithImpl;
@override @useResult
$Res call({
 String? message, List<DataEntity> remoteUpdates
});




}
/// @nodoc
class __$SyncUpdateSucessfullyCopyWithImpl<$Res>
    implements _$SyncUpdateSucessfullyCopyWith<$Res> {
  __$SyncUpdateSucessfullyCopyWithImpl(this._self, this._then);

  final _SyncUpdateSucessfully _self;
  final $Res Function(_SyncUpdateSucessfully) _then;

/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? remoteUpdates = null,}) {
  return _then(_SyncUpdateSucessfully(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,remoteUpdates: null == remoteUpdates ? _self._remoteUpdates : remoteUpdates // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,
  ));
}


}

/// @nodoc


class _SyncUpdateFailure implements SyncUpdateState {
  const _SyncUpdateFailure({required final  List<DataEntity> remoteUpdates, required this.error}): _remoteUpdates = remoteUpdates;
  

 final  List<DataEntity> _remoteUpdates;
@override List<DataEntity> get remoteUpdates {
  if (_remoteUpdates is EqualUnmodifiableListView) return _remoteUpdates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remoteUpdates);
}

 final  dynamic error;

/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncUpdateFailureCopyWith<_SyncUpdateFailure> get copyWith => __$SyncUpdateFailureCopyWithImpl<_SyncUpdateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncUpdateFailure&&const DeepCollectionEquality().equals(other._remoteUpdates, _remoteUpdates)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_remoteUpdates),const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SyncUpdateState.failure(remoteUpdates: $remoteUpdates, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SyncUpdateFailureCopyWith<$Res> implements $SyncUpdateStateCopyWith<$Res> {
  factory _$SyncUpdateFailureCopyWith(_SyncUpdateFailure value, $Res Function(_SyncUpdateFailure) _then) = __$SyncUpdateFailureCopyWithImpl;
@override @useResult
$Res call({
 List<DataEntity> remoteUpdates, dynamic error
});




}
/// @nodoc
class __$SyncUpdateFailureCopyWithImpl<$Res>
    implements _$SyncUpdateFailureCopyWith<$Res> {
  __$SyncUpdateFailureCopyWithImpl(this._self, this._then);

  final _SyncUpdateFailure _self;
  final $Res Function(_SyncUpdateFailure) _then;

/// Create a copy of SyncUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteUpdates = null,Object? error = freezed,}) {
  return _then(_SyncUpdateFailure(
remoteUpdates: null == remoteUpdates ? _self._remoteUpdates : remoteUpdates // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$SyncUpdateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncUpdateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncUpdateEvent()';
}


}

/// @nodoc
class $SyncUpdateEventCopyWith<$Res>  {
$SyncUpdateEventCopyWith(SyncUpdateEvent _, $Res Function(SyncUpdateEvent) __);
}


/// @nodoc


class SaveRemoteUpdates implements SyncUpdateEvent {
   SaveRemoteUpdates({required final  List<DataEntity> remoteUpdates}): _remoteUpdates = remoteUpdates;
  

 final  List<DataEntity> _remoteUpdates;
 List<DataEntity> get remoteUpdates {
  if (_remoteUpdates is EqualUnmodifiableListView) return _remoteUpdates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remoteUpdates);
}


/// Create a copy of SyncUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveRemoteUpdatesCopyWith<SaveRemoteUpdates> get copyWith => _$SaveRemoteUpdatesCopyWithImpl<SaveRemoteUpdates>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveRemoteUpdates&&const DeepCollectionEquality().equals(other._remoteUpdates, _remoteUpdates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_remoteUpdates));

@override
String toString() {
  return 'SyncUpdateEvent.saveRemoteUpdates(remoteUpdates: $remoteUpdates)';
}


}

/// @nodoc
abstract mixin class $SaveRemoteUpdatesCopyWith<$Res> implements $SyncUpdateEventCopyWith<$Res> {
  factory $SaveRemoteUpdatesCopyWith(SaveRemoteUpdates value, $Res Function(SaveRemoteUpdates) _then) = _$SaveRemoteUpdatesCopyWithImpl;
@useResult
$Res call({
 List<DataEntity> remoteUpdates
});




}
/// @nodoc
class _$SaveRemoteUpdatesCopyWithImpl<$Res>
    implements $SaveRemoteUpdatesCopyWith<$Res> {
  _$SaveRemoteUpdatesCopyWithImpl(this._self, this._then);

  final SaveRemoteUpdates _self;
  final $Res Function(SaveRemoteUpdates) _then;

/// Create a copy of SyncUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remoteUpdates = null,}) {
  return _then(SaveRemoteUpdates(
remoteUpdates: null == remoteUpdates ? _self._remoteUpdates : remoteUpdates // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,
  ));
}


}

/// @nodoc


class SyncSingleUpdate implements SyncUpdateEvent {
   SyncSingleUpdate({required this.remoteUpdate});
  

 final  DataEntity remoteUpdate;

/// Create a copy of SyncUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncSingleUpdateCopyWith<SyncSingleUpdate> get copyWith => _$SyncSingleUpdateCopyWithImpl<SyncSingleUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncSingleUpdate&&(identical(other.remoteUpdate, remoteUpdate) || other.remoteUpdate == remoteUpdate));
}


@override
int get hashCode => Object.hash(runtimeType,remoteUpdate);

@override
String toString() {
  return 'SyncUpdateEvent.syncUpdate(remoteUpdate: $remoteUpdate)';
}


}

/// @nodoc
abstract mixin class $SyncSingleUpdateCopyWith<$Res> implements $SyncUpdateEventCopyWith<$Res> {
  factory $SyncSingleUpdateCopyWith(SyncSingleUpdate value, $Res Function(SyncSingleUpdate) _then) = _$SyncSingleUpdateCopyWithImpl;
@useResult
$Res call({
 DataEntity remoteUpdate
});




}
/// @nodoc
class _$SyncSingleUpdateCopyWithImpl<$Res>
    implements $SyncSingleUpdateCopyWith<$Res> {
  _$SyncSingleUpdateCopyWithImpl(this._self, this._then);

  final SyncSingleUpdate _self;
  final $Res Function(SyncSingleUpdate) _then;

/// Create a copy of SyncUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remoteUpdate = null,}) {
  return _then(SyncSingleUpdate(
remoteUpdate: null == remoteUpdate ? _self.remoteUpdate : remoteUpdate // ignore: cast_nullable_to_non_nullable
as DataEntity,
  ));
}


}

// dart format on
