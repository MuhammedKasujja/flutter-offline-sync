import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/services/network_exception.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({required Dio dio}) : _dio = dio;

  /// Handle all `Post` requests using this method
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data = const {},
  }) async {
    // logger.debug(data);
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
      logger.error({
        'Response size': formatSize(
          utf8.encode(jsonEncode(response.data)).length,
        ),
      });
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

  /// Handle all `Get List` requests using this method
  Future<ApiResponse<List<T>>> getList<T>({
    required String url,
    required T Function(dynamic json) converter,
    Map<String, dynamic> queryParams = const {},
  }) async {
    try {
      final res = await _dio.get(url, queryParameters: queryParams);
      return ApiResponse.fromJsonList(res.data, converter);
    } catch (ex) {
      return ApiResponse.error(
        NetworkException.getErrorMessage(NetworkException.getDioException(ex)),
      );
    }
  }
}
