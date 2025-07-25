import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_offline_sync/src/constants.dart';
import 'package:flutter_offline_sync/src/data/models/models.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';

final int _settingsId = 1;

class ConfigService {
  static Future<ConfigurationEntity?> getSettings() async {
    return getBox<ConfigurationEntity>().get(_settingsId);
  }

  static Future<ConfigurationEntity?> saveSettings(
    ConfigurationEntity settings,
  ) async {
    return saveEntity<ConfigurationEntity>(settings);
  }

  static Future<ConfigurationEntity?> saveCurrentDeviceId() async {
    var config = kDebugMode ? await _getDemoConfig() : await getSettings();

    config ??= ConfigurationEntity();

    config.currentDeviceId ??= Uuid().v4();
    config.remoteEndpoint = kDemoRemoteDownloadUrl;
    config.localEndpoint = kDemoRemoteUploadUrl;
    config.addSyncDeviceEndpoint = kDemoRemoteAddSyncDeviceUrl;
    config.connectAccountEndpoint = kDemoConnectAccountEndpoint;

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> saveAuthToken(String? authToken) async {
    var config = await getSettings();

    config ??= ConfigurationEntity();
    config.authToken = authToken;

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> updateLastSyncDate(
    DateTime lastSyncDate,
  ) async {
    var config = await getSettings();

    config ??= ConfigurationEntity();
    config.localLastUpdatedAt = lastSyncDate;

    return saveSettings(config);
  }

  static Future<String?> getCurrentDeviceId() async {
    var config = await getSettings();

    return config?.currentDeviceId;
  }

  static Future<ConfigurationEntity?> regenerateDeviceId() async {
    var config = await getSettings();
    config ??= ConfigurationEntity();

    config.currentDeviceId = null;
    config.currentDeviceId = Uuid().v4();

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> resetSyncDates() async {
    var config = await getSettings();
    config ??= ConfigurationEntity();

    config.localLastUpdatedAt = null;
    config.remoteLastUpdatedAt = null;

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> _getDemoConfig() async {
    final config = ConfigurationEntity();

    config.currentDeviceId ??= Uuid().v4();
    config.baseUrl = kDemoBaseUrl;
    config.accountKey = kDemoAccountKey;

    return saveEntity(config);
  }

  static Future<ConfigurationEntity?> getRefreshedConfig() async {
    await ConfigService.saveCurrentDeviceId();
    return await ConfigService.getSettings();
  }
}
