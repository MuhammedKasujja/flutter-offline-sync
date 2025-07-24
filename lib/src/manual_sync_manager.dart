import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_offline_sync/src/data/services/syncroniser/data_syncroniser_interface.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

import 'data/services/syncroniser_service.dart';
import 'network_status.dart';

part 'manual_sync_manager.g.dart';

@riverpod
class ManualSyncManager extends _$ManualSyncManager {
  @override
  FutureOr<void> build() {}

  Future<void> syncData() async {
    late IDataSyncroniser repo;
    String? syncId;
    state = const AsyncLoading();
    try {
      final isConnected = await ref.watch(networkStatusProvider.future);

      final config = await ConfigService.getSettings();
      repo = AppConfig.instance.syncronizer;

      if (config != null && config.hasRemoteCredentials) {
        if (isConnected) {
          // if (syncId == null) {
          syncId = '9000-${DateTime.now().millisecondsSinceEpoch}';
          await SyncroniserService(repo).startSync(syncId);
          syncId = null;
          // }
        } else {
          logger.debug("No internet connection");
        }
      } else {
        logger.debug({
          'Sync Config settings not available': config?.toJson(),
        }, level: LogLevel.db);
      }
      state = const AsyncData(null);
    } catch (error, st) {
      state = AsyncError(error, st);
      logger.error(error);
    } finally {}
  }
}
