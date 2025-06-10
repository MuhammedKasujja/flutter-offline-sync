import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';

class RemoteConfigService extends IRemoteConfigService {
  final ApiClient apiClient;

  RemoteConfigService({required this.apiClient});

  @override
  Future<ApiResponse> saveUserSyncDevice(String userId) async {
    final settings = await ConfigService.getSettings();
    return apiClient.post(
      '/config/sync_device',
      data: {
        'deviceId': settings?.currentDeviceId,
        'accountKey': settings?.accountKey,
        'userId': userId,
      },
    );
  }
}

abstract class IRemoteConfigService {
  Future<ApiResponse> saveUserSyncDevice(String userId);
}
