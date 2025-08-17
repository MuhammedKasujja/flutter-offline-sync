import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/data/remote_changes_service.dart';

part 'sync_update_bloc.freezed.dart';
part 'sync_update_event.dart';
part 'sync_update_state.dart';

class SyncUpdateBloc extends Bloc<SyncUpdateEvent, SyncUpdateState> {
  SyncUpdateBloc() : super(const SyncUpdateState.initial(remoteUpdates: [])) {
    on<SaveRemoteUpdates>((event, emit) async {
      try {
        emit(SyncUpdateState.loading(remoteUpdates: event.remoteUpdates));
        final config = await ConfigService.getSettings();

        if (config?.hasRemoteCredentials == true) {
          await RemoteChangesService().syncRemoteUpdates();
          emit(_SyncUpdateSucessfully(remoteUpdates: []));
        } else {
          throw Exception(
            'Please setup the device to enable uploading changes',
          );
        }
      } catch (error) {
        emit(
          SyncUpdateState.error(
            error: error,
            remoteUpdates: event.remoteUpdates,
          ),
        );
      }
    });

    on<PersistRemoteChangesManually>((event, emit) {
      add(SaveRemoteUpdates(remoteUpdates: state.remoteUpdates));
    });

    on<StageRemoteChanges>((event, emit) async {
      try {
        final changes =
            await RemoteChangesService().getRemoteLocalUnSavedData();
        if (changes.isEmpty) {
          throw Exception('No updates found');
        }
        emit(_SyncStagedChanges(remoteUpdates: changes));
      } catch (error) {
        emit(
          SyncUpdateState.error(
            error: error,
            remoteUpdates: state.remoteUpdates,
          ),
        );
      }
    });
  }
}
