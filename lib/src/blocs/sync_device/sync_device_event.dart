part of 'sync_device_bloc.dart';

@freezed
class SyncDeviceEvent with _$SyncDeviceEvent {
  factory SyncDeviceEvent.fetchLocalDevices() = _FetchLocalDevices;
  factory SyncDeviceEvent.fetchRemoteDevices() = _FetchRemoteDevices;
}
