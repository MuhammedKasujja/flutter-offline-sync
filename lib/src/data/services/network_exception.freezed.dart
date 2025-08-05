// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkException implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException()';
}


}

/// @nodoc
class $NetworkExceptionCopyWith<$Res>  {
$NetworkExceptionCopyWith(NetworkException _, $Res Function(NetworkException) __);
}


/// Adds pattern-matching-related methods to [NetworkException].
extension NetworkExceptionPatterns on NetworkException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RequestCancelled value)?  requestCancelled,TResult Function( UnauthorisedRequest value)?  unauthorisedRequest,TResult Function( InvalidAuthToken value)?  invalidAuthToken,TResult Function( BadRequest value)?  badRequest,TResult Function( NotFound value)?  notFound,TResult Function( MethodNotAllowed value)?  methodNotAllowed,TResult Function( NotAcceptable value)?  notAcceptable,TResult Function( RequestTimeout value)?  requestTimeout,TResult Function( SendTimeout value)?  sendTimeout,TResult Function( Conflict value)?  conflict,TResult Function( InternalServerError value)?  internalServerError,TResult Function( NotImplemented value)?  notImplemented,TResult Function( ServiceUnavailable value)?  serviceUnavailable,TResult Function( NoInternetConnection value)?  noInternetConnection,TResult Function( FormatException value)?  formatException,TResult Function( UnableToProcess value)?  unableToProcess,TResult Function( DefaultError value)?  defaultError,TResult Function( UnexpectedError value)?  unexpectedError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case UnauthorisedRequest() when unauthorisedRequest != null:
return unauthorisedRequest(_that);case InvalidAuthToken() when invalidAuthToken != null:
return invalidAuthToken(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case Conflict() when conflict != null:
return conflict(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case DefaultError() when defaultError != null:
return defaultError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RequestCancelled value)  requestCancelled,required TResult Function( UnauthorisedRequest value)  unauthorisedRequest,required TResult Function( InvalidAuthToken value)  invalidAuthToken,required TResult Function( BadRequest value)  badRequest,required TResult Function( NotFound value)  notFound,required TResult Function( MethodNotAllowed value)  methodNotAllowed,required TResult Function( NotAcceptable value)  notAcceptable,required TResult Function( RequestTimeout value)  requestTimeout,required TResult Function( SendTimeout value)  sendTimeout,required TResult Function( Conflict value)  conflict,required TResult Function( InternalServerError value)  internalServerError,required TResult Function( NotImplemented value)  notImplemented,required TResult Function( ServiceUnavailable value)  serviceUnavailable,required TResult Function( NoInternetConnection value)  noInternetConnection,required TResult Function( FormatException value)  formatException,required TResult Function( UnableToProcess value)  unableToProcess,required TResult Function( DefaultError value)  defaultError,required TResult Function( UnexpectedError value)  unexpectedError,}){
final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled(_that);case UnauthorisedRequest():
return unauthorisedRequest(_that);case InvalidAuthToken():
return invalidAuthToken(_that);case BadRequest():
return badRequest(_that);case NotFound():
return notFound(_that);case MethodNotAllowed():
return methodNotAllowed(_that);case NotAcceptable():
return notAcceptable(_that);case RequestTimeout():
return requestTimeout(_that);case SendTimeout():
return sendTimeout(_that);case Conflict():
return conflict(_that);case InternalServerError():
return internalServerError(_that);case NotImplemented():
return notImplemented(_that);case ServiceUnavailable():
return serviceUnavailable(_that);case NoInternetConnection():
return noInternetConnection(_that);case FormatException():
return formatException(_that);case UnableToProcess():
return unableToProcess(_that);case DefaultError():
return defaultError(_that);case UnexpectedError():
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RequestCancelled value)?  requestCancelled,TResult? Function( UnauthorisedRequest value)?  unauthorisedRequest,TResult? Function( InvalidAuthToken value)?  invalidAuthToken,TResult? Function( BadRequest value)?  badRequest,TResult? Function( NotFound value)?  notFound,TResult? Function( MethodNotAllowed value)?  methodNotAllowed,TResult? Function( NotAcceptable value)?  notAcceptable,TResult? Function( RequestTimeout value)?  requestTimeout,TResult? Function( SendTimeout value)?  sendTimeout,TResult? Function( Conflict value)?  conflict,TResult? Function( InternalServerError value)?  internalServerError,TResult? Function( NotImplemented value)?  notImplemented,TResult? Function( ServiceUnavailable value)?  serviceUnavailable,TResult? Function( NoInternetConnection value)?  noInternetConnection,TResult? Function( FormatException value)?  formatException,TResult? Function( UnableToProcess value)?  unableToProcess,TResult? Function( DefaultError value)?  defaultError,TResult? Function( UnexpectedError value)?  unexpectedError,}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case UnauthorisedRequest() when unauthorisedRequest != null:
return unauthorisedRequest(_that);case InvalidAuthToken() when invalidAuthToken != null:
return invalidAuthToken(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case Conflict() when conflict != null:
return conflict(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case DefaultError() when defaultError != null:
return defaultError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requestCancelled,TResult Function()?  unauthorisedRequest,TResult Function()?  invalidAuthToken,TResult Function()?  badRequest,TResult Function()?  notFound,TResult Function()?  methodNotAllowed,TResult Function()?  notAcceptable,TResult Function()?  requestTimeout,TResult Function()?  sendTimeout,TResult Function()?  conflict,TResult Function()?  internalServerError,TResult Function()?  notImplemented,TResult Function()?  serviceUnavailable,TResult Function()?  noInternetConnection,TResult Function()?  formatException,TResult Function()?  unableToProcess,TResult Function( String error)?  defaultError,TResult Function()?  unexpectedError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled();case UnauthorisedRequest() when unauthorisedRequest != null:
return unauthorisedRequest();case InvalidAuthToken() when invalidAuthToken != null:
return invalidAuthToken();case BadRequest() when badRequest != null:
return badRequest();case NotFound() when notFound != null:
return notFound();case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed();case NotAcceptable() when notAcceptable != null:
return notAcceptable();case RequestTimeout() when requestTimeout != null:
return requestTimeout();case SendTimeout() when sendTimeout != null:
return sendTimeout();case Conflict() when conflict != null:
return conflict();case InternalServerError() when internalServerError != null:
return internalServerError();case NotImplemented() when notImplemented != null:
return notImplemented();case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable();case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case FormatException() when formatException != null:
return formatException();case UnableToProcess() when unableToProcess != null:
return unableToProcess();case DefaultError() when defaultError != null:
return defaultError(_that.error);case UnexpectedError() when unexpectedError != null:
return unexpectedError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requestCancelled,required TResult Function()  unauthorisedRequest,required TResult Function()  invalidAuthToken,required TResult Function()  badRequest,required TResult Function()  notFound,required TResult Function()  methodNotAllowed,required TResult Function()  notAcceptable,required TResult Function()  requestTimeout,required TResult Function()  sendTimeout,required TResult Function()  conflict,required TResult Function()  internalServerError,required TResult Function()  notImplemented,required TResult Function()  serviceUnavailable,required TResult Function()  noInternetConnection,required TResult Function()  formatException,required TResult Function()  unableToProcess,required TResult Function( String error)  defaultError,required TResult Function()  unexpectedError,}) {final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled();case UnauthorisedRequest():
return unauthorisedRequest();case InvalidAuthToken():
return invalidAuthToken();case BadRequest():
return badRequest();case NotFound():
return notFound();case MethodNotAllowed():
return methodNotAllowed();case NotAcceptable():
return notAcceptable();case RequestTimeout():
return requestTimeout();case SendTimeout():
return sendTimeout();case Conflict():
return conflict();case InternalServerError():
return internalServerError();case NotImplemented():
return notImplemented();case ServiceUnavailable():
return serviceUnavailable();case NoInternetConnection():
return noInternetConnection();case FormatException():
return formatException();case UnableToProcess():
return unableToProcess();case DefaultError():
return defaultError(_that.error);case UnexpectedError():
return unexpectedError();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requestCancelled,TResult? Function()?  unauthorisedRequest,TResult? Function()?  invalidAuthToken,TResult? Function()?  badRequest,TResult? Function()?  notFound,TResult? Function()?  methodNotAllowed,TResult? Function()?  notAcceptable,TResult? Function()?  requestTimeout,TResult? Function()?  sendTimeout,TResult? Function()?  conflict,TResult? Function()?  internalServerError,TResult? Function()?  notImplemented,TResult? Function()?  serviceUnavailable,TResult? Function()?  noInternetConnection,TResult? Function()?  formatException,TResult? Function()?  unableToProcess,TResult? Function( String error)?  defaultError,TResult? Function()?  unexpectedError,}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled();case UnauthorisedRequest() when unauthorisedRequest != null:
return unauthorisedRequest();case InvalidAuthToken() when invalidAuthToken != null:
return invalidAuthToken();case BadRequest() when badRequest != null:
return badRequest();case NotFound() when notFound != null:
return notFound();case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed();case NotAcceptable() when notAcceptable != null:
return notAcceptable();case RequestTimeout() when requestTimeout != null:
return requestTimeout();case SendTimeout() when sendTimeout != null:
return sendTimeout();case Conflict() when conflict != null:
return conflict();case InternalServerError() when internalServerError != null:
return internalServerError();case NotImplemented() when notImplemented != null:
return notImplemented();case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable();case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case FormatException() when formatException != null:
return formatException();case UnableToProcess() when unableToProcess != null:
return unableToProcess();case DefaultError() when defaultError != null:
return defaultError(_that.error);case UnexpectedError() when unexpectedError != null:
return unexpectedError();case _:
  return null;

}
}

}

/// @nodoc


class RequestCancelled with DiagnosticableTreeMixin implements NetworkException {
  const RequestCancelled();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.requestCancelled'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.requestCancelled()';
}


}




/// @nodoc


class UnauthorisedRequest with DiagnosticableTreeMixin implements NetworkException {
  const UnauthorisedRequest();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.unauthorisedRequest'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorisedRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.unauthorisedRequest()';
}


}




/// @nodoc


class InvalidAuthToken with DiagnosticableTreeMixin implements NetworkException {
  const InvalidAuthToken();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.invalidAuthToken'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidAuthToken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.invalidAuthToken()';
}


}




/// @nodoc


class BadRequest with DiagnosticableTreeMixin implements NetworkException {
  const BadRequest();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.badRequest'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.badRequest()';
}


}




/// @nodoc


class NotFound with DiagnosticableTreeMixin implements NetworkException {
  const NotFound();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.notFound'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.notFound()';
}


}




/// @nodoc


class MethodNotAllowed with DiagnosticableTreeMixin implements NetworkException {
  const MethodNotAllowed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.methodNotAllowed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MethodNotAllowed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.methodNotAllowed()';
}


}




/// @nodoc


class NotAcceptable with DiagnosticableTreeMixin implements NetworkException {
  const NotAcceptable();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.notAcceptable'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotAcceptable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.notAcceptable()';
}


}




/// @nodoc


class RequestTimeout with DiagnosticableTreeMixin implements NetworkException {
  const RequestTimeout();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.requestTimeout'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.requestTimeout()';
}


}




/// @nodoc


class SendTimeout with DiagnosticableTreeMixin implements NetworkException {
  const SendTimeout();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.sendTimeout'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.sendTimeout()';
}


}




/// @nodoc


class Conflict with DiagnosticableTreeMixin implements NetworkException {
  const Conflict();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.conflict'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.conflict()';
}


}




/// @nodoc


class InternalServerError with DiagnosticableTreeMixin implements NetworkException {
  const InternalServerError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.internalServerError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.internalServerError()';
}


}




/// @nodoc


class NotImplemented with DiagnosticableTreeMixin implements NetworkException {
  const NotImplemented();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.notImplemented'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotImplemented);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.notImplemented()';
}


}




/// @nodoc


class ServiceUnavailable with DiagnosticableTreeMixin implements NetworkException {
  const ServiceUnavailable();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.serviceUnavailable'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.serviceUnavailable()';
}


}




/// @nodoc


class NoInternetConnection with DiagnosticableTreeMixin implements NetworkException {
  const NoInternetConnection();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.noInternetConnection'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.noInternetConnection()';
}


}




/// @nodoc


class FormatException with DiagnosticableTreeMixin implements NetworkException {
  const FormatException();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.formatException'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormatException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.formatException()';
}


}




/// @nodoc


class UnableToProcess with DiagnosticableTreeMixin implements NetworkException {
  const UnableToProcess();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.unableToProcess'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnableToProcess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.unableToProcess()';
}


}




/// @nodoc


class DefaultError with DiagnosticableTreeMixin implements NetworkException {
  const DefaultError(this.error);
  

 final  String error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultErrorCopyWith<DefaultError> get copyWith => _$DefaultErrorCopyWithImpl<DefaultError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.defaultError'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.defaultError(error: $error)';
}


}

/// @nodoc
abstract mixin class $DefaultErrorCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $DefaultErrorCopyWith(DefaultError value, $Res Function(DefaultError) _then) = _$DefaultErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DefaultErrorCopyWithImpl<$Res>
    implements $DefaultErrorCopyWith<$Res> {
  _$DefaultErrorCopyWithImpl(this._self, this._then);

  final DefaultError _self;
  final $Res Function(DefaultError) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DefaultError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnexpectedError with DiagnosticableTreeMixin implements NetworkException {
  const UnexpectedError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NetworkException.unexpectedError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NetworkException.unexpectedError()';
}


}




// dart format on
