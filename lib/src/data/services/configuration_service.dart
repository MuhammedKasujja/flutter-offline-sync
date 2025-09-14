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
    ConfigurationEntity? settings,
  ) async {
    if (settings == null) return settings;
    return saveEntity<ConfigurationEntity>(settings);
  }

  static Future<ConfigurationEntity?> saveCurrentDeviceId() async {
    var config = await getSettings();

    config ??= ConfigurationEntity();

    config = config.syncIfNull(
      currentDeviceId: Uuid().v4(),
      baseUrl: kDebugMode ? kDemoBaseUrl : null,
      accountKey: kDebugMode ? kDemoAccountKey : null,
      remoteEndpoint: kDemoRemoteDownloadUrl,
      localEndpoint: kDemoRemoteUploadUrl,
      addSyncDeviceEndpoint: kDemoRemoteAddSyncDeviceUrl,
      connectAccountEndpoint: kDemoConnectAccountEndpoint,
      syncDeviceListEndpoint: kDemoRemoteAccountSyncDevicesUrl,
    );

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> saveAuthToken(String? authToken) async {
    var config = await getSettings();

    config ??= await saveCurrentDeviceId();
    config?.authToken = authToken;

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> updateLastSyncDate(
    DateTime lastSyncDate,
  ) async {
    var config = await getSettings();

    config ??= await saveCurrentDeviceId();
    config?.localLastUpdatedAt = lastSyncDate;

    return saveSettings(config);
  }

  static Future<String?> getCurrentDeviceId() async {
    var config = await getSettings();

    return config?.currentDeviceId;
  }

  static Future<ConfigurationEntity?> regenerateDeviceId() async {
    var config = await getSettings();
    config ??= await saveCurrentDeviceId();

    config?.currentDeviceId = Uuid().v4();

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> resetSyncDates() async {
    var config = await getSettings();
    config ??= await saveCurrentDeviceId();

    config?.localLastUpdatedAt = null;
    config?.remoteLastUpdatedAt = null;

    return saveSettings(config);
  }

  static Future<ConfigurationEntity?> getRefreshedConfig() async {
    if (kReleaseMode) {
      // using [ConfigService.saveCurrentDeviceId()] in PRODUCTION
      // to avoid registering same device with another sync devic account
      await ConfigService.saveCurrentDeviceId();
    } else {
      await ConfigService.regenerateDeviceId();
    }
    return await ConfigService.getSettings();
  }
}
