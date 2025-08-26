// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 List<Map<String, dynamic>>? get data;
/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalUpdatesStateCopyWith<LocalUpdatesState> get copyWith => _$LocalUpdatesStateCopyWithImpl<LocalUpdatesState>(this as LocalUpdatesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalUpdatesState&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'LocalUpdatesState(data: $data)';
}


}

/// @nodoc
abstract mixin class $LocalUpdatesStateCopyWith<$Res>  {
  factory $LocalUpdatesStateCopyWith(LocalUpdatesState value, $Res Function(LocalUpdatesState) _then) = _$LocalUpdatesStateCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> data
});




}
/// @nodoc
class _$LocalUpdatesStateCopyWithImpl<$Res>
    implements $LocalUpdatesStateCopyWith<$Res> {
  _$LocalUpdatesStateCopyWithImpl(this._self, this._then);

  final LocalUpdatesState _self;
  final $Res Function(LocalUpdatesState) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data! : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalUpdatesState].
extension LocalUpdatesStatePatterns on LocalUpdatesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadInProgress value)?  loading,TResult Function( _LocalUpdatesLoaded value)?  success,TResult Function( _LocalChangesUploaded value)?  uploaded,TResult Function( _LocalUpdatesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _LocalUpdatesLoaded() when success != null:
return success(_that);case _LocalChangesUploaded() when uploaded != null:
return uploaded(_that);case _LocalUpdatesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadInProgress value)  loading,required TResult Function( _LocalUpdatesLoaded value)  success,required TResult Function( _LocalChangesUploaded value)  uploaded,required TResult Function( _LocalUpdatesFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadInProgress():
return loading(_that);case _LocalUpdatesLoaded():
return success(_that);case _LocalChangesUploaded():
return uploaded(_that);case _LocalUpdatesFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadInProgress value)?  loading,TResult? Function( _LocalUpdatesLoaded value)?  success,TResult? Function( _LocalChangesUploaded value)?  uploaded,TResult? Function( _LocalUpdatesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadInProgress() when loading != null:
return loading(_that);case _LocalUpdatesLoaded() when success != null:
return success(_that);case _LocalChangesUploaded() when uploaded != null:
return uploaded(_that);case _LocalUpdatesFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Map<String, dynamic>>? data)?  initial,TResult Function( List<Map<String, dynamic>>? data)?  loading,TResult Function( List<Map<String, dynamic>> data)?  success,TResult Function( String? message,  List<Map<String, dynamic>>? data)?  uploaded,TResult Function( dynamic error,  List<Map<String, dynamic>>? data)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.data);case _LoadInProgress() when loading != null:
return loading(_that.data);case _LocalUpdatesLoaded() when success != null:
return success(_that.data);case _LocalChangesUploaded() when uploaded != null:
return uploaded(_that.message,_that.data);case _LocalUpdatesFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Map<String, dynamic>>? data)  initial,required TResult Function( List<Map<String, dynamic>>? data)  loading,required TResult Function( List<Map<String, dynamic>> data)  success,required TResult Function( String? message,  List<Map<String, dynamic>>? data)  uploaded,required TResult Function( dynamic error,  List<Map<String, dynamic>>? data)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.data);case _LoadInProgress():
return loading(_that.data);case _LocalUpdatesLoaded():
return success(_that.data);case _LocalChangesUploaded():
return uploaded(_that.message,_that.data);case _LocalUpdatesFailure():
return failure(_that.error,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Map<String, dynamic>>? data)?  initial,TResult? Function( List<Map<String, dynamic>>? data)?  loading,TResult? Function( List<Map<String, dynamic>> data)?  success,TResult? Function( String? message,  List<Map<String, dynamic>>? data)?  uploaded,TResult? Function( dynamic error,  List<Map<String, dynamic>>? data)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.data);case _LoadInProgress() when loading != null:
return loading(_that.data);case _LocalUpdatesLoaded() when success != null:
return success(_that.data);case _LocalChangesUploaded() when uploaded != null:
return uploaded(_that.message,_that.data);case _LocalUpdatesFailure() when failure != null:
return failure(_that.error,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LocalUpdatesState {
  const _Initial({final  List<Map<String, dynamic>>? data}): _data = data;
  

 final  List<Map<String, dynamic>>? _data;
@override List<Map<String, dynamic>>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LocalUpdatesState
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
  return 'LocalUpdatesState.initial(data: $data)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>>? data
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_Initial(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}

/// @nodoc


class _LoadInProgress implements LocalUpdatesState {
  const _LoadInProgress({final  List<Map<String, dynamic>>? data}): _data = data;
  

 final  List<Map<String, dynamic>>? _data;
@override List<Map<String, dynamic>>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadInProgressCopyWith<_LoadInProgress> get copyWith => __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadInProgress&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LocalUpdatesState.loading(data: $data)';
}


}

/// @nodoc
abstract mixin class _$LoadInProgressCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(_LoadInProgress value, $Res Function(_LoadInProgress) _then) = __$LoadInProgressCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>>? data
});




}
/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(this._self, this._then);

  final _LoadInProgress _self;
  final $Res Function(_LoadInProgress) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_LoadInProgress(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}

/// @nodoc


class _LocalUpdatesLoaded implements LocalUpdatesState {
  const _LocalUpdatesLoaded({required final  List<Map<String, dynamic>> data}): _data = data;
  

 final  List<Map<String, dynamic>> _data;
@override List<Map<String, dynamic>> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalUpdatesLoadedCopyWith<_LocalUpdatesLoaded> get copyWith => __$LocalUpdatesLoadedCopyWithImpl<_LocalUpdatesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalUpdatesLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LocalUpdatesState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$LocalUpdatesLoadedCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory _$LocalUpdatesLoadedCopyWith(_LocalUpdatesLoaded value, $Res Function(_LocalUpdatesLoaded) _then) = __$LocalUpdatesLoadedCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> data
});




}
/// @nodoc
class __$LocalUpdatesLoadedCopyWithImpl<$Res>
    implements _$LocalUpdatesLoadedCopyWith<$Res> {
  __$LocalUpdatesLoadedCopyWithImpl(this._self, this._then);

  final _LocalUpdatesLoaded _self;
  final $Res Function(_LocalUpdatesLoaded) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_LocalUpdatesLoaded(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class _LocalChangesUploaded implements LocalUpdatesState {
  const _LocalChangesUploaded(this.message, {final  List<Map<String, dynamic>>? data}): _data = data;
  

 final  String? message;
 final  List<Map<String, dynamic>>? _data;
@override List<Map<String, dynamic>>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalChangesUploadedCopyWith<_LocalChangesUploaded> get copyWith => __$LocalChangesUploadedCopyWithImpl<_LocalChangesUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalChangesUploaded&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LocalUpdatesState.uploaded(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LocalChangesUploadedCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory _$LocalChangesUploadedCopyWith(_LocalChangesUploaded value, $Res Function(_LocalChangesUploaded) _then) = __$LocalChangesUploadedCopyWithImpl;
@override @useResult
$Res call({
 String? message, List<Map<String, dynamic>>? data
});




}
/// @nodoc
class __$LocalChangesUploadedCopyWithImpl<$Res>
    implements _$LocalChangesUploadedCopyWith<$Res> {
  __$LocalChangesUploadedCopyWithImpl(this._self, this._then);

  final _LocalChangesUploaded _self;
  final $Res Function(_LocalChangesUploaded) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? data = freezed,}) {
  return _then(_LocalChangesUploaded(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}

/// @nodoc


class _LocalUpdatesFailure implements LocalUpdatesState {
  const _LocalUpdatesFailure(this.error, {final  List<Map<String, dynamic>>? data}): _data = data;
  

 final  dynamic error;
 final  List<Map<String, dynamic>>? _data;
@override List<Map<String, dynamic>>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalUpdatesFailureCopyWith<_LocalUpdatesFailure> get copyWith => __$LocalUpdatesFailureCopyWithImpl<_LocalUpdatesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalUpdatesFailure&&const DeepCollectionEquality().equals(other.error, error)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LocalUpdatesState.failure(error: $error, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LocalUpdatesFailureCopyWith<$Res> implements $LocalUpdatesStateCopyWith<$Res> {
  factory _$LocalUpdatesFailureCopyWith(_LocalUpdatesFailure value, $Res Function(_LocalUpdatesFailure) _then) = __$LocalUpdatesFailureCopyWithImpl;
@override @useResult
$Res call({
 dynamic error, List<Map<String, dynamic>>? data
});




}
/// @nodoc
class __$LocalUpdatesFailureCopyWithImpl<$Res>
    implements _$LocalUpdatesFailureCopyWith<$Res> {
  __$LocalUpdatesFailureCopyWithImpl(this._self, this._then);

  final _LocalUpdatesFailure _self;
  final $Res Function(_LocalUpdatesFailure) _then;

/// Create a copy of LocalUpdatesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? data = freezed,}) {
  return _then(_LocalUpdatesFailure(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
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


/// Adds pattern-matching-related methods to [LocalUpdatesEvent].
extension LocalUpdatesEventPatterns on LocalUpdatesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchLocalChanges value)?  fetchLocalChanges,TResult Function( UploadLocalChanges value)?  uploadLocalChanges,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchLocalChanges() when fetchLocalChanges != null:
return fetchLocalChanges(_that);case UploadLocalChanges() when uploadLocalChanges != null:
return uploadLocalChanges(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchLocalChanges value)  fetchLocalChanges,required TResult Function( UploadLocalChanges value)  uploadLocalChanges,}){
final _that = this;
switch (_that) {
case FetchLocalChanges():
return fetchLocalChanges(_that);case UploadLocalChanges():
return uploadLocalChanges(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchLocalChanges value)?  fetchLocalChanges,TResult? Function( UploadLocalChanges value)?  uploadLocalChanges,}){
final _that = this;
switch (_that) {
case FetchLocalChanges() when fetchLocalChanges != null:
return fetchLocalChanges(_that);case UploadLocalChanges() when uploadLocalChanges != null:
return uploadLocalChanges(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime? lastSyncDate)?  fetchLocalChanges,TResult Function()?  uploadLocalChanges,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchLocalChanges() when fetchLocalChanges != null:
return fetchLocalChanges(_that.lastSyncDate);case UploadLocalChanges() when uploadLocalChanges != null:
return uploadLocalChanges();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime? lastSyncDate)  fetchLocalChanges,required TResult Function()  uploadLocalChanges,}) {final _that = this;
switch (_that) {
case FetchLocalChanges():
return fetchLocalChanges(_that.lastSyncDate);case UploadLocalChanges():
return uploadLocalChanges();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime? lastSyncDate)?  fetchLocalChanges,TResult? Function()?  uploadLocalChanges,}) {final _that = this;
switch (_that) {
case FetchLocalChanges() when fetchLocalChanges != null:
return fetchLocalChanges(_that.lastSyncDate);case UploadLocalChanges() when uploadLocalChanges != null:
return uploadLocalChanges();case _:
  return null;

}
}

}

/// @nodoc


class FetchLocalChanges implements LocalUpdatesEvent {
   FetchLocalChanges({this.lastSyncDate});
  

 final  DateTime? lastSyncDate;

/// Create a copy of LocalUpdatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchLocalChangesCopyWith<FetchLocalChanges> get copyWith => _$FetchLocalChangesCopyWithImpl<FetchLocalChanges>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchLocalChanges&&(identical(other.lastSyncDate, lastSyncDate) || other.lastSyncDate == lastSyncDate));
}


@override
int get hashCode => Object.hash(runtimeType,lastSyncDate);

@override
String toString() {
  return 'LocalUpdatesEvent.fetchLocalChanges(lastSyncDate: $lastSyncDate)';
}


}

/// @nodoc
abstract mixin class $FetchLocalChangesCopyWith<$Res> implements $LocalUpdatesEventCopyWith<$Res> {
  factory $FetchLocalChangesCopyWith(FetchLocalChanges value, $Res Function(FetchLocalChanges) _then) = _$FetchLocalChangesCopyWithImpl;
@useResult
$Res call({
 DateTime? lastSyncDate
});




}
/// @nodoc
class _$FetchLocalChangesCopyWithImpl<$Res>
    implements $FetchLocalChangesCopyWith<$Res> {
  _$FetchLocalChangesCopyWithImpl(this._self, this._then);

  final FetchLocalChanges _self;
  final $Res Function(FetchLocalChanges) _then;

/// Create a copy of LocalUpdatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastSyncDate = freezed,}) {
  return _then(FetchLocalChanges(
lastSyncDate: freezed == lastSyncDate ? _self.lastSyncDate : lastSyncDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class UploadLocalChanges implements LocalUpdatesEvent {
   UploadLocalChanges();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadLocalChanges);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalUpdatesEvent.uploadLocalChanges()';
}


}




// dart format on
