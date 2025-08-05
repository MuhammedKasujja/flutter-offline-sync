// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internet_connection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InternetConnectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternetConnectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionEvent()';
}


}

/// @nodoc
class $InternetConnectionEventCopyWith<$Res>  {
$InternetConnectionEventCopyWith(InternetConnectionEvent _, $Res Function(InternetConnectionEvent) __);
}


/// Adds pattern-matching-related methods to [InternetConnectionEvent].
extension InternetConnectionEventPatterns on InternetConnectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckConnectivity value)?  checkConnectivity,TResult Function( ConnectivityChanged value)?  connectivityChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckConnectivity() when checkConnectivity != null:
return checkConnectivity(_that);case ConnectivityChanged() when connectivityChanged != null:
return connectivityChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckConnectivity value)  checkConnectivity,required TResult Function( ConnectivityChanged value)  connectivityChanged,}){
final _that = this;
switch (_that) {
case CheckConnectivity():
return checkConnectivity(_that);case ConnectivityChanged():
return connectivityChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckConnectivity value)?  checkConnectivity,TResult? Function( ConnectivityChanged value)?  connectivityChanged,}){
final _that = this;
switch (_that) {
case CheckConnectivity() when checkConnectivity != null:
return checkConnectivity(_that);case ConnectivityChanged() when connectivityChanged != null:
return connectivityChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkConnectivity,TResult Function( ConnectivityResult connectivity)?  connectivityChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckConnectivity() when checkConnectivity != null:
return checkConnectivity();case ConnectivityChanged() when connectivityChanged != null:
return connectivityChanged(_that.connectivity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkConnectivity,required TResult Function( ConnectivityResult connectivity)  connectivityChanged,}) {final _that = this;
switch (_that) {
case CheckConnectivity():
return checkConnectivity();case ConnectivityChanged():
return connectivityChanged(_that.connectivity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkConnectivity,TResult? Function( ConnectivityResult connectivity)?  connectivityChanged,}) {final _that = this;
switch (_that) {
case CheckConnectivity() when checkConnectivity != null:
return checkConnectivity();case ConnectivityChanged() when connectivityChanged != null:
return connectivityChanged(_that.connectivity);case _:
  return null;

}
}

}

/// @nodoc


class CheckConnectivity implements InternetConnectionEvent {
   CheckConnectivity();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckConnectivity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionEvent.checkConnectivity()';
}


}




/// @nodoc


class ConnectivityChanged implements InternetConnectionEvent {
   ConnectivityChanged(this.connectivity);
  

 final  ConnectivityResult connectivity;

/// Create a copy of InternetConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectivityChangedCopyWith<ConnectivityChanged> get copyWith => _$ConnectivityChangedCopyWithImpl<ConnectivityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectivityChanged&&(identical(other.connectivity, connectivity) || other.connectivity == connectivity));
}


@override
int get hashCode => Object.hash(runtimeType,connectivity);

@override
String toString() {
  return 'InternetConnectionEvent.connectivityChanged(connectivity: $connectivity)';
}


}

/// @nodoc
abstract mixin class $ConnectivityChangedCopyWith<$Res> implements $InternetConnectionEventCopyWith<$Res> {
  factory $ConnectivityChangedCopyWith(ConnectivityChanged value, $Res Function(ConnectivityChanged) _then) = _$ConnectivityChangedCopyWithImpl;
@useResult
$Res call({
 ConnectivityResult connectivity
});




}
/// @nodoc
class _$ConnectivityChangedCopyWithImpl<$Res>
    implements $ConnectivityChangedCopyWith<$Res> {
  _$ConnectivityChangedCopyWithImpl(this._self, this._then);

  final ConnectivityChanged _self;
  final $Res Function(ConnectivityChanged) _then;

/// Create a copy of InternetConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? connectivity = null,}) {
  return _then(ConnectivityChanged(
null == connectivity ? _self.connectivity : connectivity // ignore: cast_nullable_to_non_nullable
as ConnectivityResult,
  ));
}


}

/// @nodoc
mixin _$InternetConnectionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternetConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState()';
}


}

/// @nodoc
class $InternetConnectionStateCopyWith<$Res>  {
$InternetConnectionStateCopyWith(InternetConnectionState _, $Res Function(InternetConnectionState) __);
}


/// Adds pattern-matching-related methods to [InternetConnectionState].
extension InternetConnectionStatePatterns on InternetConnectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Connected value)?  connected,TResult Function( _Offline value)?  offline,TResult Function( _NoInternet value)?  noInternet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Connected() when connected != null:
return connected(_that);case _Offline() when offline != null:
return offline(_that);case _NoInternet() when noInternet != null:
return noInternet(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Connected value)  connected,required TResult Function( _Offline value)  offline,required TResult Function( _NoInternet value)  noInternet,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Connected():
return connected(_that);case _Offline():
return offline(_that);case _NoInternet():
return noInternet(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Connected value)?  connected,TResult? Function( _Offline value)?  offline,TResult? Function( _NoInternet value)?  noInternet,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Connected() when connected != null:
return connected(_that);case _Offline() when offline != null:
return offline(_that);case _NoInternet() when noInternet != null:
return noInternet(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  connected,TResult Function()?  offline,TResult Function()?  noInternet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Connected() when connected != null:
return connected();case _Offline() when offline != null:
return offline();case _NoInternet() when noInternet != null:
return noInternet();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  connected,required TResult Function()  offline,required TResult Function()  noInternet,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Connected():
return connected();case _Offline():
return offline();case _NoInternet():
return noInternet();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  connected,TResult? Function()?  offline,TResult? Function()?  noInternet,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Connected() when connected != null:
return connected();case _Offline() when offline != null:
return offline();case _NoInternet() when noInternet != null:
return noInternet();case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements InternetConnectionState {
   _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState.idle()';
}


}




/// @nodoc


class _Connected implements InternetConnectionState {
   _Connected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState.connected()';
}


}




/// @nodoc


class _Offline implements InternetConnectionState {
   _Offline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Offline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState.offline()';
}


}




/// @nodoc


class _NoInternet implements InternetConnectionState {
   _NoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InternetConnectionState.noInternet()';
}


}




// dart format on
