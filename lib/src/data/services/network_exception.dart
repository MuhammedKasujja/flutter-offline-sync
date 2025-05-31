import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_offline_sync/src/constants.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_exception.freezed.dart';

@freezed
abstract class NetworkException with _$NetworkException {
  const factory NetworkException.requestCancelled() = RequestCancelled;

  const factory NetworkException.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkException.invalidAuthToken() = InvalidAuthToken;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.notFound() = NotFound;

  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkException.notAcceptable() = NotAcceptable;

  const factory NetworkException.requestTimeout() = RequestTimeout;

  const factory NetworkException.sendTimeout() = SendTimeout;

  const factory NetworkException.conflict() = Conflict;

  const factory NetworkException.internalServerError() = InternalServerError;

  const factory NetworkException.notImplemented() = NotImplemented;

  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.formatException() = FormatException;

  const factory NetworkException.unableToProcess() = UnableToProcess;

  const factory NetworkException.defaultError(String error) = DefaultError;

  const factory NetworkException.unexpectedError() = UnexpectedError;

  ///
  /// return a defined [error] thrown by the [exception]
  ///
  static NetworkException getDioException(error) {
    logger.warning(error);
    if (error is Exception) {
      try {
        late NetworkException networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkException.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkException.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions = const NetworkException.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkException.sendTimeout();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = const NetworkException.noInternetConnection();
              break;
            case DioExceptionType.badResponse:
              logger.info(error.response?.data);
              switch (error.response?.statusCode) {
                case 403:
                case 1004: // API invalid token error_code
                  networkExceptions =
                      const NetworkException.unauthorisedRequest();
                  break;
                case 404:
                  // networkExceptions = const NetworkException.notFound();
                  networkExceptions = NetworkException.defaultError(
                    error.response?.data['message'] ?? '',
                  );
                  break;
                case 409:
                  networkExceptions = const NetworkException.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkException.requestTimeout();
                  break;
                case 500:
                  networkExceptions =
                      const NetworkException.internalServerError();
                  break;
                case 413:
                  networkExceptions = const NetworkException.defaultError(
                    kErrorFileTooLarge,
                  );
                  break;
                case 503:
                  networkExceptions =
                      const NetworkException.serviceUnavailable();
                  break;
                default:
                  final message = error.response?.data['message'];
                  networkExceptions = NetworkException.defaultError(message);
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkException.sendTimeout();
              break;
            default:
              networkExceptions = const NetworkException.unexpectedError();
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkException.noInternetConnection();
        } else {
          logger.debug({'DioUnexpectedError': error});
          networkExceptions = const NetworkException.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        logger.debug({'FormatException': e});
        return const NetworkException.formatException();
      } catch (ex) {
        logger.debug({"Error Format": ex});
        return const NetworkException.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        logger.debug({'Convert to JSON error': error});
        return const NetworkException.unableToProcess();
      } else {
        logger.debug({'unexpectedError': error});
        return const NetworkException.unexpectedError();
      }
    }
  }

  ///
  /// Get the error message from the [networkException]
  ///
  static String getErrorMessage(NetworkException networkException) {
    return switch (networkException) {
      RequestCancelled() => kErrorRequestCancelled,
      UnauthorisedRequest() => kErrorUnauthorisedRequest,
      BadRequest() => kErrorBadRequest,
      NotFound() => kErrorNotFound,
      MethodNotAllowed() => kErrorMethodNotAllowed,
      NotAcceptable() => kErrorNotAcceptable,
      RequestTimeout() => kErrorRequestTimeout,
      SendTimeout() => kErrorSendTimeout,
      Conflict() => kErrorConflict,
      InternalServerError() => kErrorInternalServerError,
      NotImplemented() => kErrorNotImplemented,
      ServiceUnavailable() => kErrorServiceUnavailable,
      NoInternetConnection() => kErrorNoInternetConnection,
      FormatException() => kErrorFormatException,
      UnableToProcess() => kErrorUnableToProcess,
      DefaultError(:final error) => error,
      UnexpectedError() => kErrorUnexpectedError,
      NetworkException() => kErrorDefaultError,
    };
  }
}
