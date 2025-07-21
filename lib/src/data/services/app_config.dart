import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser/data_syncroniser_interface.dart';
import 'package:flutter_offline_sync/src/data/models/configuration_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser/data_syncroniser.dart';
import 'package:flutter_offline_sync/src/data/services/sync_repository.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

final class AppConfig {
  late ConfigurationEntity _config;
  ApiClient? _apiClient;

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;

  static AppConfig get I => _instance;

  AppConfig._internal();

  Future<void> init() {
    return _initialized();
  }

  Future<void> restart() {
    return _initialized();
  }

  Future _initialized() async {
    _config = getSettings();
    _apiClient ??= ApiClient(
      dio: Dio(
        BaseOptions(
          baseUrl: _config.baseUrl ?? '',
          contentType: 'application/json',
          headers: _headers,
        ),
      ),
    );
  }

  ApiClient getClient() {
    return _apiClient!;
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

  DateTime getLastSyncDate() {
    return getSettings().localLastUpdatedAt ??
        DateTime.fromMillisecondsSinceEpoch(1641031200000);
  }

  DateTime getLastRemoteSyncDate() {
    return getSettings().remoteLastUpdatedAt ??
        DateTime.fromMillisecondsSinceEpoch(1641031200000);
  }

  Future<List<SyncDeviceEntity>> getSyncDevices() {
    return getBox<SyncDeviceEntity>().getAllAsync();
  }

  Future<void> saveSettings(ConfigurationEntity settings) async {
    await ConfigService.saveSettings(settings);
    await restart();
  }

  IDataSyncroniser get syncronizer {
    return DataSyncroniser(
      config: _config,
      apiClient: getClient(),
      syncRepository: SyncRepositoryImp(),
    );
  }
}
