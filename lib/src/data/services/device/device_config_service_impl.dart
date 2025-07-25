import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/device/device_config_service.dart';

class DeviceConfigServiceImpl extends DeviceConfigService {
  DeviceConfigServiceImpl({required super.apiClient});

  @override
  Future<ApiResponse> registerDevice(SyncDeviceRequest request) async {
    final deviceId = await ConfigService.getSyncGeneratedDeviceId();
    final requestModel = request.copyWith(deviceId: deviceId, userId: '7899');
    return apiClient.post(request.apiRegisterUrl, data: requestModel.toJson());
  }
}
