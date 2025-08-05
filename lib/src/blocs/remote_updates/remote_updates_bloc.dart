import 'package:bloc/bloc.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_updates_state.dart';
part 'remote_updates_event.dart';
part 'remote_updates_bloc.freezed.dart';

class RemoteUpdatesBloc extends Bloc<RemoteUpdatesEvent, RemoteUpdatesState> {
  RemoteUpdatesBloc() : super(const RemoteUpdatesState.initial()) {
    on<FetchRemotePendingUpdates>((event, emit) async {
      try {
        emit(RemoteUpdatesState.loading());
        final config = await ConfigService.getSettings();

        if (config != null && config.hasRemoteCredentials) {
          final data =
              await SyncroniserService(
                AppConfig.instance.syncronizer,
              ).fetchRemotePendingData();
          emit(RemoteUpdatesFetched(data));
        } else {
          throw Exception(
            'Please setup the device to enable getting remote changes',
          );
        }
      } catch (error) {
        emit(RemoteUpdatesState.failure(error));
      }
    });
  }
}
