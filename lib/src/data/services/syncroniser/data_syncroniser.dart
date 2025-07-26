import 'dart:convert';

import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/constants.dart';
import 'package:flutter_offline_sync/src/data/interfaces/sync_repository.dart';
import 'package:flutter_offline_sync/src/data/models/models.dart';
import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/flutter_sync.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

import 'data_syncroniser_interface.dart';

// TODO: Using Isolates to handle data syncronization to remove work on the main thread
class DataSyncroniser extends IDataSyncroniser {
  late final ApiClient _apiClient;
  late final ConfigurationEntity _config;

  late final SyncRepository _syncRepository;

  DataSyncroniser({
    required ApiClient apiClient,
    required ConfigurationEntity config,
    required SyncRepository syncRepository,
  }) : _apiClient = apiClient,
       _config = config,
       _syncRepository = syncRepository;

  @override
  Future<ApiResponse<LocalSyncDataResponse>> syncLocalUpdates({
    required String updateId,
    Map<String, dynamic>? extras,
  }) async {
    final updates = await _syncRepository.getPendingLocalUpdates();

    if (updates.isEmpty) {
      return ApiResponse.error('No updates found');
    }

    if (_config.hasAccountKey == false) {
      throw Exception('Account key is required to sync updates');
    }

    if (_config.hasCurrentDeviceId == false) {
      throw Exception('Device must be registered to sync updates');
    }
    if (_config.hasConfiguredLocalEndpoint == false) {
      throw Exception('Local sync endpoint is not configured');
    }

    SyncRequest request = SyncRequest(
      userId: _config.userId ?? kDefaultConnectDeviceUserID,
      updateId: updateId,
      deviceId: _config.currentDeviceId!,
      accountKey: _config.accountKey!,
      data: updates,
    );

    if (extras != null) {
      request = request.copyWith(extras: extras);
    }

    final response = await _apiClient.post(
      _config.localEndpoint!,
      data: request.toJson(),
    );
    if (response.isSuccess) {
      return ApiResponse(
        success: response.isSuccess,
        data: LocalSyncDataResponse.fromJson(response.data),
      );
    }
    return ApiResponse.error(response.error);
  }

  @override
  Future<void> syncRemoteUpdates(List<DataEntity> remoteUpdates) async {
    if (remoteUpdates.isEmpty) {
      logger.info('No Remote updates found');
      return;
    }
    try {
      for (var remoteData in remoteUpdates) {
        /// updating local database with remote changes
        FlutterSync.instance.entityRegistry.save(
          remoteData.entity,
          jsonDecode(remoteData.data),
        );
      }
    } catch (error) {
      logger.error(error);
    }
  }

  @override
  Future addRequestExtras(Map<String, dynamic> extras) async {}

  @override
  Future<void> clearUpdatesTable() async {
    return _syncRepository.clearUpdatesTable();
  }

  @override
  Future<ApiResponse<List<SyncDataEntity>>> fetchRemoteUpdates() async {
    logger.info('Getting remote updates');
    try {
      if (!_config.hasAccountKey) {
        throw Exception('Account key is required to sync updates');
      }

      if (!_config.hasCurrentDeviceId) {
        throw Exception('Device must be registered to sync updates');
      }

      if (!_config.hasConfiguredRemoteEndpoint) {
        throw Exception('Remote sync endpoint is not configured');
      }

      final response = await _apiClient.get(
        _config.remoteEndpoint!,
        queryParameters: {
          'deviceId': _config.currentDeviceId,
          'accountKey': _config.accountKey,
        },
      );
      if (response.isSuccess) {
        logger.info(response.data);
        final updates = SyncDataEntityList.fromJson(response.data);

        return ApiResponse(success: response.isSuccess, data: updates.entities);
      }
      return ApiResponse.error(response.error);
    } catch (error, stackTrace) {
      logger.error({error, stackTrace});
      return ApiResponse.error(error.toString());
    }
  }
}
