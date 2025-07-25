import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/sync_repository.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

part 'local_data_updates.g.dart';

@riverpod
class LocalDataUpdates extends _$LocalDataUpdates {
  @override
  FutureOr<List<Map<String, dynamic>>> build() => [];

  Future<void> fetchLocalUpdates() async {
    state = const AsyncLoading();
    try {
      final config = await ConfigService.getSettings();

      if (config != null && config.hasRemoteCredentials) {
        final data = await SyncRepositoryImp().getPendingLocalUpdates();

        logger.error('fetching data');

        state = AsyncData(data);
      }
    } catch (error, st) {
      state = AsyncError(error, st);
      logger.error(error);
    } finally {}
  }
}
