import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/device/device_config_service.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

class DeviceConfigServiceImpl extends DeviceConfigService {
  DeviceConfigServiceImpl({required super.apiClient});

  @override
  Future<ApiResponse> registerDevice(SyncDeviceRequest request) async {
    final config = await ConfigService.getRefreshedConfig();
    final requestModel = request.copyWith(
      deviceId: config!.currentDeviceId!,
      userId: '7899',
    );

    final connectAccountUrl = formattedBaseUrl(
      baseUrl: request.apiRegisterUrl,
      endpoint: config.connectAccountEndpoint,
    );
    
    final reseponse = await apiClient.post(
      connectAccountUrl,
      data: requestModel.toJson(),
    );

    if (reseponse.isSuccess) {
      config.copyWith(baseUrl: formatApiBaseUrl(request.apiRegisterUrl));
      await ConfigService.saveSettings(config);
    }

    return reseponse;
  }
}
