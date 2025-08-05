// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_updates_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalUpdatesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalUpdatesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalUpdatesState()';
}


}

/// @nodoc
class $LocalUpdatesStateCopyWith<$Res>  {
$LocalUpdatesStateCopyWith(LocalUpdatesState _, $Res Function(LocalUpdatesState) __);
}


/// @nodoc


class _Initial implements LocalUpdatesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalUpdatesState.initial()';
}


}




/// @nodoc


class _LoadInProgress implements LocalUpdatesState {
  const _LoadInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalUpdatesState.loading()';
}


}




/// @nodoc


class LocalUpdatesLoaded implements LocalUpdatesState {
  const LocalUpdatesLoaded(final  List<Map<String, dynamic>> data): _data = data;
  

 final  List<Map<String, dynamic>> _data;
 List<Map<String, dynamic>> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalUpdatesLoadedCopyWith<LocalUpdatesLoaded> get copyWith => _$LocalUpdatesLoadedCopyWithImpl<LocalUpdatesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalUpdatesLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LocalUpdatesState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $LocalUpdatesLoadedCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory $LocalUpdatesLoadedCopyWith(LocalUpdatesLoaded value, $Res Function(LocalUpdatesLoaded) _then) = _$LocalUpdatesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> data
});




}
/// @nodoc
class _$LocalUpdatesLoadedCopyWithImpl<$Res>
    implements $LocalUpdatesLoadedCopyWith<$Res> {
  _$LocalUpdatesLoadedCopyWithImpl(this._self, this._then);

  final LocalUpdatesLoaded _self;
  final $Res Function(LocalUpdatesLoaded) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LocalUpdatesLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class LocalChangesUploaded implements LocalUpdatesState {
  const LocalChangesUploaded(this.message);
  

 final  String? message;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalChangesUploadedCopyWith<LocalChangesUploaded> get copyWith => _$LocalChangesUploadedCopyWithImpl<LocalChangesUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalChangesUploaded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LocalUpdatesState.uploaded(message: $message)';
}


}

/// @nodoc
abstract mixin class $LocalChangesUploadedCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory $LocalChangesUploadedCopyWith(LocalChangesUploaded value, $Res Function(LocalChangesUploaded) _then) = _$LocalChangesUploadedCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$LocalChangesUploadedCopyWithImpl<$Res>
    implements $LocalChangesUploadedCopyWith<$Res> {
  _$LocalChangesUploadedCopyWithImpl(this._self, this._then);

  final LocalChangesUploaded _self;
  final $Res Function(LocalChangesUploaded) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(LocalChangesUploaded(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LocalUpdatesFailure implements LocalUpdatesState {
  const LocalUpdatesFailure(this.error);
  

 final  dynamic error;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalUpdatesFailureCopyWith<LocalUpdatesFailure> get copyWith => _$LocalUpdatesFailureCopyWithImpl<LocalUpdatesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalUpdatesFailure&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'LocalUpdatesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $LocalUpdatesFailureCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory $LocalUpdatesFailureCopyWith(LocalUpdatesFailure value, $Res Function(LocalUpdatesFailure) _then) = _$LocalUpdatesFailureCopyWithImpl;
@useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$LocalUpdatesFailureCopyWithImpl<$Res>
    implements $LocalUpdatesFailureCopyWith<$Res> {
  _$LocalUpdatesFailureCopyWithImpl(this._self, this._then);

  final LocalUpdatesFailure _self;
  final $Res Function(LocalUpdatesFailure) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(LocalUpdatesFailure(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$LocalUpdatesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalUpdatesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalUpdatesEvent()';
}


}

/// @nodoc
class $LocalUpdatesEventCopyWith<$Res>  {
$LocalUpdatesEventCopyWith(LocalUpdatesEvent _, $Res Function(LocalUpdatesEvent) __);
}


/// @nodoc


class GetLocalChanges implements LocalUpdatesEvent {
   GetLocalChanges({this.lastSyncDate});
  

 final  DateTime? lastSyncDate;

/// Create a copy of LocalUpdatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetLocalChangesCopyWith<GetLocalChanges> get copyWith => _$GetLocalChangesCopyWithImpl<GetLocalChanges>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLocalChanges&&(identical(other.lastSyncDate, lastSyncDate) || other.lastSyncDate == lastSyncDate));
}


@override
int get hashCode => Object.hash(runtimeType,lastSyncDate);

@override
String toString() {
  return 'LocalUpdatesEvent.getLocalChanges(lastSyncDate: $lastSyncDate)';
}


}

/// @nodoc
abstract mixin class $GetLocalChangesCopyWith<$Res> implements $LocalUpdatesEventCopyWith<$Res> {
  factory $GetLocalChangesCopyWith(GetLocalChanges value, $Res Function(GetLocalChanges) _then) = _$GetLocalChangesCopyWithImpl;
@useResult
$Res call({
 DateTime? lastSyncDate
});




}
/// @nodoc
class _$GetLocalChangesCopyWithImpl<$Res>
    implements $GetLocalChangesCopyWith<$Res> {
  _$GetLocalChangesCopyWithImpl(this._self, this._then);

  final GetLocalChanges _self;
  final $Res Function(GetLocalChanges) _then;

/// Create a copy of LocalUpdatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastSyncDate = freezed,}) {
  return _then(GetLocalChanges(
lastSyncDate: freezed == lastSyncDate ? _self.lastSyncDate : lastSyncDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class UploadLocalChanges implements LocalUpdatesEvent {
   UploadLocalChanges(final  List<Map<String, dynamic>> data): _data = data;
  

 final  List<Map<String, dynamic>> _data;
 List<Map<String, dynamic>> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LocalUpdatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadLocalChangesCopyWith<UploadLocalChanges> get copyWith => _$UploadLocalChangesCopyWithImpl<UploadLocalChanges>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadLocalChanges&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LocalUpdatesEvent.uploadLocalChanges(data: $data)';
}


}

/// @nodoc
abstract mixin class $UploadLocalChangesCopyWith<$Res> implements $LocalUpdatesEventCopyWith<$Res> {
  factory $UploadLocalChangesCopyWith(UploadLocalChanges value, $Res Function(UploadLocalChanges) _then) = _$UploadLocalChangesCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> data
});




}
/// @nodoc
class _$UploadLocalChangesCopyWithImpl<$Res>
    implements $UploadLocalChangesCopyWith<$Res> {
  _$UploadLocalChangesCopyWithImpl(this._self, this._then);

  final UploadLocalChanges _self;
  final $Res Function(UploadLocalChanges) _then;

/// Create a copy of LocalUpdatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UploadLocalChanges(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
