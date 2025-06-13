import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/data/models/configuration_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

final class AppConfig {
  late ConfigurationEntity _config;

  AppConfig() {
    _config = getSettings();
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

  ConfigurationEntity getSettings() {
    return getBox<ConfigurationEntity>().getAll().first;
  }

  Future<List<SyncDeviceEntity>> getSyncDevices() {
    return getBox<SyncDeviceEntity>().getAllAsync();
  }
}
