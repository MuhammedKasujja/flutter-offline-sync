import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/data/models/configuration_entity.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

class ApiConfig {
  late ConfigurationEntity _config;

  ApiConfig() {
    _config = getBox<ConfigurationEntity>().getAll().first;
  }

  ApiClient getClient() {
    return ApiClient(
      dio: Dio(
        BaseOptions(
          baseUrl: _config.baseUrl!,
          contentType: 'application/json',
          headers: _headers,
        ),
      ),
    );
  }

  Map<String, dynamic>? get _headers {
    logger.debug({'AuthToken': _config.authToken});
    if (_config.authToken != null && _config.authToken!.isNotEmpty) {
      return {'Authorization': 'Bearer ${_config.authToken}'};
    }
    return null;
  }
}
