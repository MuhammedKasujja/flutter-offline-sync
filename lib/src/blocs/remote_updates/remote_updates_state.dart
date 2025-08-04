part of 'remote_updates_bloc.dart';

@freezed
class RemoteUpdatesState with _$RemoteUpdatesState {
  const factory RemoteUpdatesState.initial() = _Initial;
  const factory RemoteUpdatesState.loadInProgress() = _LoadInProgress;
}