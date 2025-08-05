part of 'device_configuration_bloc.dart';

@freezed
abstract class DeviceConfigurationState with _$DeviceConfigurationState {
  const factory DeviceConfigurationState.initial({
    required DeviceConfigStep configStep,
  }) = _Initial;
  const factory DeviceConfigurationState.loading({
    required DeviceConfigStep configStep,
  }) = _LoadInProgress;
  const factory DeviceConfigurationState.success({
    String? message,
    required DeviceConfigStep configStep,
  }) = _Sucessfully;
  const factory DeviceConfigurationState.error({
    required DeviceConfigStep configStep,
    dynamic error,
  }) = _Failure;
}
