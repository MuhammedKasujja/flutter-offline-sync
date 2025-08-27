import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/requests/register_device.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

class RemoteConfigService extends IRemoteConfigService {
  final ApiClient apiClient;

  RemoteConfigService({required this.apiClient});

  @override
  Future<ApiResponse> syncCurrentDevice({
    required RegisterDeviceDTO request,
  }) async {
    var settings = await ConfigService.getSettings();

    if (settings?.addSyncDeviceEndpoint == null) {
      throw Exception(
        'Please configure add sync device endpoint and try again',
      );
    }
    final url = formattedBaseUrl(
      baseUrl: request.syncUrl,
      endpoint: settings!.addSyncDeviceEndpoint!,
    );

    final response = await apiClient.post(
      url,
      data: {
        'deviceId': settings.currentDeviceId,
        'accountKey': request.accountKey,
        'userId': request.userId,
        'userName': request.userName,
      },
    );

    if (response.isSuccess) {
      settings = settings.copyWith(
        baseUrl: formatApiBaseUrl(request.syncUrl),
        userName: request.userName,
        userId: request.userId,
        accountKey: request.accountKey,
        remoteEndpoint:
            (request.remoteEndpoint ?? '').isNotEmpty
                ? request.remoteEndpoint
                : null,
        localEndpoint:
            (request.localEndpoint ?? '').isNotEmpty
                ? request.localEndpoint
                : null,
        addSyncDeviceEndpoint:
            (request.addSyncDeviceEndpoint ?? '').isNotEmpty
                ? request.addSyncDeviceEndpoint
                : null,
        connectAccountEndpoint:
            (request.connectAccountEndpoint ?? '').isNotEmpty
                ? request.connectAccountEndpoint
                : null,
      );
      await ConfigService.saveSettings(settings);

      /// refresh global settings after saving device
      /// TODO: use dependence injection to avoid refreshing the global settings
      await AppConfig.instance.restart();
    }

    return response;
  }

  @override
  Future<ApiResponse> deleteSyncDevice({required String deviceId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getSyncDevices() async {
    final settings = await ConfigService.getSettings();
    return apiClient.get(settings!.addSyncDeviceEndpoint!);
  }

  @override
  Future<ApiResponse> addSyncDevice({
    required String userId,
    required String deviceId,
    required String userName,
    required String accountKey,
  }) async {
    final settings = await ConfigService.getSettings();
    return apiClient.post(
      settings!.addSyncDeviceEndpoint!,
      data: {
        'deviceId': deviceId,
        'accountKey': accountKey,
        'userId': userId,
        'userName': userName,
      },
    );
  }
}

abstract class IRemoteConfigService {
  Future<ApiResponse> addSyncDevice({
    required String userId,
    required String deviceId,
    required String userName,
    required String accountKey,
  });
  Future<ApiResponse> getSyncDevices();
  Future<ApiResponse> deleteSyncDevice({required String deviceId});
  Future<ApiResponse> syncCurrentDevice({required RegisterDeviceDTO request});
}
