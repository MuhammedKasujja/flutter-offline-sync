import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';

abstract class DeviceConfigService {
  final ApiClient apiClient;

  DeviceConfigService({required this.apiClient});
  Future<ApiResponse> registerDevice(SyncDeviceRequest request);
}
