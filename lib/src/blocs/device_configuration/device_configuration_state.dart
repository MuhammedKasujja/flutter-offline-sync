part of 'device_configuration_bloc.dart';

@freezed
class DeviceConfigurationState with _$DeviceConfigurationState {
  const factory DeviceConfigurationState.initial() = _Initial;
  const factory DeviceConfigurationState.loading() = _LoadInProgress;
  const factory DeviceConfigurationState.success({String? message}) =
      _Sucessfully;
  const factory DeviceConfigurationState.error(dynamic error) = _Failure;
}
