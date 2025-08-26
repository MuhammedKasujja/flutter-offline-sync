part of 'remote_updates_bloc.dart';

@freezed
abstract class RemoteUpdatesEvent with _$RemoteUpdatesEvent {
  factory RemoteUpdatesEvent.fetchRemotePendingData() =
      FetchRemotePendingUpdates;
}
