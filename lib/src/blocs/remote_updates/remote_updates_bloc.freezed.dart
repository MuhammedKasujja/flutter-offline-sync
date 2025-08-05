// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_updates_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteUpdatesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteUpdatesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteUpdatesState()';
}


}

/// @nodoc
class $RemoteUpdatesStateCopyWith<$Res>  {
$RemoteUpdatesStateCopyWith(RemoteUpdatesState _, $Res Function(RemoteUpdatesState) __);
}


/// @nodoc


class _Initial implements RemoteUpdatesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteUpdatesState.initial()';
}


}




/// @nodoc


class _LoadInProgress implements RemoteUpdatesState {
  const _LoadInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteUpdatesState.loading()';
}


}




/// @nodoc


class RemoteUpdatesFetched implements RemoteUpdatesState {
  const RemoteUpdatesFetched(final  List<DataEntity> data): _data = data;
  

 final  List<DataEntity> _data;
 List<DataEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of RemoteUpdatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteUpdatesFetchedCopyWith<RemoteUpdatesFetched> get copyWith => _$RemoteUpdatesFetchedCopyWithImpl<RemoteUpdatesFetched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteUpdatesFetched&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'RemoteUpdatesState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $RemoteUpdatesFetchedCopyWith<$Res> implements $RemoteUpdatesStateCopyWith<$Res> {
  factory $RemoteUpdatesFetchedCopyWith(RemoteUpdatesFetched value, $Res Function(RemoteUpdatesFetched) _then) = _$RemoteUpdatesFetchedCopyWithImpl;
@useResult
$Res call({
 List<DataEntity> data
});




}
/// @nodoc
class _$RemoteUpdatesFetchedCopyWithImpl<$Res>
    implements $RemoteUpdatesFetchedCopyWith<$Res> {
  _$RemoteUpdatesFetchedCopyWithImpl(this._self, this._then);

  final RemoteUpdatesFetched _self;
  final $Res Function(RemoteUpdatesFetched) _then;

/// Create a copy of RemoteUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(RemoteUpdatesFetched(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,
  ));
}


}

/// @nodoc


class RemoteUpdatesFailure implements RemoteUpdatesState {
  const RemoteUpdatesFailure(this.error);
  

 final  dynamic error;

/// Create a copy of RemoteUpdatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteUpdatesFailureCopyWith<RemoteUpdatesFailure> get copyWith => _$RemoteUpdatesFailureCopyWithImpl<RemoteUpdatesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteUpdatesFailure&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'RemoteUpdatesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $RemoteUpdatesFailureCopyWith<$Res> implements $RemoteUpdatesStateCopyWith<$Res> {
  factory $RemoteUpdatesFailureCopyWith(RemoteUpdatesFailure value, $Res Function(RemoteUpdatesFailure) _then) = _$RemoteUpdatesFailureCopyWithImpl;
@useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$RemoteUpdatesFailureCopyWithImpl<$Res>
    implements $RemoteUpdatesFailureCopyWith<$Res> {
  _$RemoteUpdatesFailureCopyWithImpl(this._self, this._then);

  final RemoteUpdatesFailure _self;
  final $Res Function(RemoteUpdatesFailure) _then;

/// Create a copy of RemoteUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(RemoteUpdatesFailure(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$RemoteUpdatesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteUpdatesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteUpdatesEvent()';
}


}

/// @nodoc
class $RemoteUpdatesEventCopyWith<$Res>  {
$RemoteUpdatesEventCopyWith(RemoteUpdatesEvent _, $Res Function(RemoteUpdatesEvent) __);
}


/// @nodoc


class FetchRemotePendingUpdates implements RemoteUpdatesEvent {
   FetchRemotePendingUpdates();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchRemotePendingUpdates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteUpdatesEvent.fetchRemotePendingData()';
}


}




// dart format on
