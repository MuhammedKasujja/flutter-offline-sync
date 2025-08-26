part of 'local_updates_bloc.dart';

@freezed
sealed class LocalUpdatesState with _$LocalUpdatesState {
  const factory LocalUpdatesState.initial({List<Map<String, dynamic>>? data}) =
      _Initial;
  const factory LocalUpdatesState.loading({List<Map<String, dynamic>>? data}) =
      _LoadInProgress;
  const factory LocalUpdatesState.success({required List<Map<String, dynamic>> data}) =
      _LocalUpdatesLoaded;
  const factory LocalUpdatesState.uploaded(
    String? message,
    {List<Map<String, dynamic>>? data,}
  ) = _LocalChangesUploaded;
  const factory LocalUpdatesState.failure(
    dynamic error,
    {List<Map<String, dynamic>>? data,}
  ) = _LocalUpdatesFailure;
}
