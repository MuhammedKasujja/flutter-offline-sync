part of 'local_updates_bloc.dart';

@freezed
sealed class LocalUpdatesState with _$LocalUpdatesState {
  const factory LocalUpdatesState.initial() = _Initial;
  const factory LocalUpdatesState.loading() = _LoadInProgress;
  const factory LocalUpdatesState.success(List<Map<String, dynamic>> data) =
      LocalUpdatesLoaded;
  const factory LocalUpdatesState.uploaded(String? message) =
      LocalChangesUploaded;
  const factory LocalUpdatesState.failure(dynamic error) = LocalUpdatesFailure;
}
