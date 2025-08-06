part of 'device_configuration_bloc.dart';

@freezed
abstract class DeviceConfigurationEvent with _$DeviceConfigurationEvent {
  factory DeviceConfigurationEvent.registerDevice(
    SyncDeviceRequest requestDetails,
  ) = RegisterDevice;
  factory DeviceConfigurationEvent.showSyncRemoteUpdates() =
      _ShowSyncRemoteUpdates;
}
