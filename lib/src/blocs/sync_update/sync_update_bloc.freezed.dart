// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_update_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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


/// Adds pattern-matching-related methods to [SyncUpdateEvent].
extension SyncUpdateEventPatterns on SyncUpdateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SaveRemoteUpdates value)?  saveRemoteUpdates,TResult Function( SyncSingleUpdate value)?  syncUpdate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SaveRemoteUpdates() when saveRemoteUpdates != null:
return saveRemoteUpdates(_that);case SyncSingleUpdate() when syncUpdate != null:
return syncUpdate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SaveRemoteUpdates value)  saveRemoteUpdates,required TResult Function( SyncSingleUpdate value)  syncUpdate,}){
final _that = this;
switch (_that) {
case SaveRemoteUpdates():
return saveRemoteUpdates(_that);case SyncSingleUpdate():
return syncUpdate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SaveRemoteUpdates value)?  saveRemoteUpdates,TResult? Function( SyncSingleUpdate value)?  syncUpdate,}){
final _that = this;
switch (_that) {
case SaveRemoteUpdates() when saveRemoteUpdates != null:
return saveRemoteUpdates(_that);case SyncSingleUpdate() when syncUpdate != null:
return syncUpdate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<DataEntity> remoteUpdates)?  saveRemoteUpdates,TResult Function( DataEntity remoteUpdate)?  syncUpdate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SaveRemoteUpdates() when saveRemoteUpdates != null:
return saveRemoteUpdates(_that.remoteUpdates);case SyncSingleUpdate() when syncUpdate != null:
return syncUpdate(_that.remoteUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<DataEntity> remoteUpdates)  saveRemoteUpdates,required TResult Function( DataEntity remoteUpdate)  syncUpdate,}) {final _that = this;
switch (_that) {
case SaveRemoteUpdates():
return saveRemoteUpdates(_that.remoteUpdates);case SyncSingleUpdate():
return syncUpdate(_that.remoteUpdate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<DataEntity> remoteUpdates)?  saveRemoteUpdates,TResult? Function( DataEntity remoteUpdate)?  syncUpdate,}) {final _that = this;
switch (_that) {
case SaveRemoteUpdates() when saveRemoteUpdates != null:
return saveRemoteUpdates(_that.remoteUpdates);case SyncSingleUpdate() when syncUpdate != null:
return syncUpdate(_that.remoteUpdate);case _:
  return null;

}
}

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


/// Adds pattern-matching-related methods to [SyncUpdateState].
extension SyncUpdateStatePatterns on SyncUpdateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadInProgress value)?  loading,TResult Function( _SyncUpdateSucessfully value)?  success,TResult Function( _SyncUpdateFailure value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _SyncUpdateSucessfully() when success != null:
return success(_that);case _SyncUpdateFailure() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadInProgress value)  loading,required TResult Function( _SyncUpdateSucessfully value)  success,required TResult Function( _SyncUpdateFailure value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadInProgress():
return loading(_that);case _SyncUpdateSucessfully():
return success(_that);case _SyncUpdateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadInProgress value)?  loading,TResult? Function( _SyncUpdateSucessfully value)?  success,TResult? Function( _SyncUpdateFailure value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _SyncUpdateSucessfully() when success != null:
return success(_that);case _SyncUpdateFailure() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<DataEntity> remoteUpdates)?  initial,TResult Function( List<DataEntity> remoteUpdates)?  loading,TResult Function( String? message,  List<DataEntity> remoteUpdates)?  success,TResult Function( List<DataEntity> remoteUpdates,  dynamic error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteUpdates);case _LoadInProgress() when loading != null:
return loading(_that.remoteUpdates);case _SyncUpdateSucessfully() when success != null:
return success(_that.message,_that.remoteUpdates);case _SyncUpdateFailure() when error != null:
return error(_that.remoteUpdates,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<DataEntity> remoteUpdates)  initial,required TResult Function( List<DataEntity> remoteUpdates)  loading,required TResult Function( String? message,  List<DataEntity> remoteUpdates)  success,required TResult Function( List<DataEntity> remoteUpdates,  dynamic error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.remoteUpdates);case _LoadInProgress():
return loading(_that.remoteUpdates);case _SyncUpdateSucessfully():
return success(_that.message,_that.remoteUpdates);case _SyncUpdateFailure():
return error(_that.remoteUpdates,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<DataEntity> remoteUpdates)?  initial,TResult? Function( List<DataEntity> remoteUpdates)?  loading,TResult? Function( String? message,  List<DataEntity> remoteUpdates)?  success,TResult? Function( List<DataEntity> remoteUpdates,  dynamic error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteUpdates);case _LoadInProgress() when loading != null:
return loading(_that.remoteUpdates);case _SyncUpdateSucessfully() when success != null:
return success(_that.message,_that.remoteUpdates);case _SyncUpdateFailure() when error != null:
return error(_that.remoteUpdates,_that.error);case _:
  return null;

}
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
  return 'SyncUpdateState.error(remoteUpdates: $remoteUpdates, error: $error)';
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

// dart format on
