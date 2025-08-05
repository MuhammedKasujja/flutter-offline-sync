// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [RemoteUpdatesState].
extension RemoteUpdatesStatePatterns on RemoteUpdatesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadInProgress value)?  loading,TResult Function( _RemoteUpdatesFetched value)?  success,TResult Function( _RemoteUpdatesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _RemoteUpdatesFetched() when success != null:
return success(_that);case _RemoteUpdatesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadInProgress value)  loading,required TResult Function( _RemoteUpdatesFetched value)  success,required TResult Function( _RemoteUpdatesFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadInProgress():
return loading(_that);case _RemoteUpdatesFetched():
return success(_that);case _RemoteUpdatesFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadInProgress value)?  loading,TResult? Function( _RemoteUpdatesFetched value)?  success,TResult? Function( _RemoteUpdatesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _RemoteUpdatesFetched() when success != null:
return success(_that);case _RemoteUpdatesFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DataEntity> data)?  success,TResult Function( dynamic error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadInProgress() when loading != null:
return loading();case _RemoteUpdatesFetched() when success != null:
return success(_that.data);case _RemoteUpdatesFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DataEntity> data)  success,required TResult Function( dynamic error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadInProgress():
return loading();case _RemoteUpdatesFetched():
return success(_that.data);case _RemoteUpdatesFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DataEntity> data)?  success,TResult? Function( dynamic error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadInProgress() when loading != null:
return loading();case _RemoteUpdatesFetched() when success != null:
return success(_that.data);case _RemoteUpdatesFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

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


class _RemoteUpdatesFetched implements RemoteUpdatesState {
  const _RemoteUpdatesFetched(final  List<DataEntity> data): _data = data;
  

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
_$RemoteUpdatesFetchedCopyWith<_RemoteUpdatesFetched> get copyWith => __$RemoteUpdatesFetchedCopyWithImpl<_RemoteUpdatesFetched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteUpdatesFetched&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'RemoteUpdatesState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$RemoteUpdatesFetchedCopyWith<$Res> implements $RemoteUpdatesStateCopyWith<$Res> {
  factory _$RemoteUpdatesFetchedCopyWith(_RemoteUpdatesFetched value, $Res Function(_RemoteUpdatesFetched) _then) = __$RemoteUpdatesFetchedCopyWithImpl;
@useResult
$Res call({
 List<DataEntity> data
});




}
/// @nodoc
class __$RemoteUpdatesFetchedCopyWithImpl<$Res>
    implements _$RemoteUpdatesFetchedCopyWith<$Res> {
  __$RemoteUpdatesFetchedCopyWithImpl(this._self, this._then);

  final _RemoteUpdatesFetched _self;
  final $Res Function(_RemoteUpdatesFetched) _then;

/// Create a copy of RemoteUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_RemoteUpdatesFetched(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DataEntity>,
  ));
}


}

/// @nodoc


class _RemoteUpdatesFailure implements RemoteUpdatesState {
  const _RemoteUpdatesFailure(this.error);
  

 final  dynamic error;

/// Create a copy of RemoteUpdatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteUpdatesFailureCopyWith<_RemoteUpdatesFailure> get copyWith => __$RemoteUpdatesFailureCopyWithImpl<_RemoteUpdatesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteUpdatesFailure&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'RemoteUpdatesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$RemoteUpdatesFailureCopyWith<$Res> implements $RemoteUpdatesStateCopyWith<$Res> {
  factory _$RemoteUpdatesFailureCopyWith(_RemoteUpdatesFailure value, $Res Function(_RemoteUpdatesFailure) _then) = __$RemoteUpdatesFailureCopyWithImpl;
@useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class __$RemoteUpdatesFailureCopyWithImpl<$Res>
    implements _$RemoteUpdatesFailureCopyWith<$Res> {
  __$RemoteUpdatesFailureCopyWithImpl(this._self, this._then);

  final _RemoteUpdatesFailure _self;
  final $Res Function(_RemoteUpdatesFailure) _then;

/// Create a copy of RemoteUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(_RemoteUpdatesFailure(
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


/// Adds pattern-matching-related methods to [RemoteUpdatesEvent].
extension RemoteUpdatesEventPatterns on RemoteUpdatesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchRemotePendingUpdates value)?  fetchRemotePendingData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchRemotePendingUpdates() when fetchRemotePendingData != null:
return fetchRemotePendingData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchRemotePendingUpdates value)  fetchRemotePendingData,}){
final _that = this;
switch (_that) {
case FetchRemotePendingUpdates():
return fetchRemotePendingData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchRemotePendingUpdates value)?  fetchRemotePendingData,}){
final _that = this;
switch (_that) {
case FetchRemotePendingUpdates() when fetchRemotePendingData != null:
return fetchRemotePendingData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchRemotePendingData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchRemotePendingUpdates() when fetchRemotePendingData != null:
return fetchRemotePendingData();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchRemotePendingData,}) {final _that = this;
switch (_that) {
case FetchRemotePendingUpdates():
return fetchRemotePendingData();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchRemotePendingData,}) {final _that = this;
switch (_that) {
case FetchRemotePendingUpdates() when fetchRemotePendingData != null:
return fetchRemotePendingData();case _:
  return null;

}
}

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
