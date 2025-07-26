import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_offline_sync/src/data/models/models.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser_service.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

part 'remote_data_updates.g.dart';

@riverpod
class RemoteDataUpdates extends _$RemoteDataUpdates {
  @override
  FutureOr<List<DataEntity>> build() async => [];

  Future<void> fetchUpdates() async {
    try {
      state = const AsyncLoading();

      final config = await ConfigService.getSettings();

      if (config != null && config.hasRemoteCredentials) {
        final data =
            await SyncroniserService(
              AppConfig.instance.syncronizer,
            ).fetchRemotePendingData();

        state = AsyncData(data);
      }
    } catch (error, st) {
      state = AsyncError(error, st);
      logger.error(error);
    }
  }
}

@riverpod
class SyncRemoteUpdates extends _$SyncRemoteUpdates {
  @override
  FutureOr<void> build() {}

  Future<void> syncUpdates(List<DataEntity> remoteUpdates) async {
    try {
      state = AsyncLoading();

      if (remoteUpdates.isEmpty) {
        state = AsyncData(null);
        return;
      }

      final repo = AppConfig.instance.syncronizer;

      await repo.syncRemoteUpdates(remoteUpdates);

      state = AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
