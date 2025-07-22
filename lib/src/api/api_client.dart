import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/services/network_exception.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({required Dio dio}) : _dio = dio;

  /// Handle all `Post` requests using this method
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data = const {},
  }) async {
    logger.info({'RequestData': data});
    try {
      final response = await _dio.post(endpoint, data: data);

      if (response.statusCode == 200) {
        return ApiResponse<T>.success(response.data);
      }
      return ApiResponse.error(response.data['error'] ?? '');
    } catch (error, stackTrace) {
      logger.error({'Error': error, 'StackTrace': stackTrace});
      return ApiResponse.error(
        NetworkException.getErrorMessage(
          NetworkException.getDioException(error),
        ),
      );
    }
  }

  /// Handle all `Get` requests using this method
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    dynamic queryParameters = const {},
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return ApiResponse<T>.success(response.data);
      }
      return ApiResponse.fromError(response.data);
    } catch (error, stackTrace) {
      logger.error({'Error': error, 'StackTrace': stackTrace});
      return ApiResponse.error(
        NetworkException.getErrorMessage(
          NetworkException.getDioException(error),
        ),
      );
    }
  }
}
