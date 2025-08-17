part of 'remote_updates_bloc.dart';

@freezed
sealed class RemoteUpdatesState with _$RemoteUpdatesState {
  const factory RemoteUpdatesState.initial() = _Initial;
  const factory RemoteUpdatesState.loading() = _LoadInProgress;
  const factory RemoteUpdatesState.success(List<SyncDataEntity> data) =
      _RemoteUpdatesFetched;
  const factory RemoteUpdatesState.failure(dynamic error) =
      _RemoteUpdatesFailure;
}
