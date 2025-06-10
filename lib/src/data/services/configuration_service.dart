import 'package:flutter_offline_sync/src/data/models/models.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
import 'package:uuid/uuid.dart';

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
    var config = await getSettings();
    config ??= ConfigurationEntity();

    config.currentDeviceId ??= Uuid().v4();
    // TODO: remove demo settings
    config.accountKey = 'JKDEYR79ER8OEJR0095';
    config.remoteEndpoint = 'remote-uploads';
    config.localEndpoint = 'upload-updates';
    config.addSyncDeviceEndpoint = 'config/sync_device';

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
}
