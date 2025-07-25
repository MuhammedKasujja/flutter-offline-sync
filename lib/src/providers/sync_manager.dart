import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser/data_syncroniser_interface.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser_service.dart';

import 'network_status.dart';

part 'sync_manager.g.dart';

@Riverpod(keepAlive: true)
class SyncManager extends _$SyncManager {
  late IDataSyncroniser _repo;

  @override
  FutureOr<void> build() async {
    String? syncId;
    ref.listen<AsyncValue<bool>>(networkStatusProvider, (previous, next) async {
      final config = await ConfigService.getSettings();
      _repo = AppConfig.instance.syncronizer;

      if (config != null && config.hasRemoteCredentials) {
        next.whenData((isConnected) async {
          if (isConnected) {
            if (syncId == null) {
              syncId = '9000-${DateTime.now().millisecondsSinceEpoch}';
              await SyncroniserService(_repo).startSync(syncId!);
              syncId = null;
            }
          } else {
            logger.debug("No internet connection");
          }
        });
      } else {
        logger.debug({
          'Sync Config settings not available': config?.toJson(),
        }, level: LogLevel.db);
      }
    });
  }
}
