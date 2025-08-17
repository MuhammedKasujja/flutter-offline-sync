import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_offline_sync/src/blocs/blocs.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/device_configuration_form.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/remote_changes_fetcher.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/sync_remote_updates_widget.dart';

class DeviceConfiguration extends StatefulWidget {
  const DeviceConfiguration({super.key, required this.onDeviceSynced});

  /// perform side effects after device sync with remote Account data
  final void Function() onDeviceSynced;

  @override
  State<DeviceConfiguration> createState() => _DeviceConfigurationState();
}

class _DeviceConfigurationState extends State<DeviceConfiguration> {
  @override
  void initState() {
    context.read<SyncUpdateBloc>().add(StageRemoteChanges());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SyncUpdateBloc, SyncUpdateState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message, remoteUpdates) => widget.onDeviceSynced.call(),
          stagedChanges: (remoteUpdates) {
            context.read<DeviceConfigurationBloc>().add(
              DeviceConfigurationEvent.showSyncRemoteUpdates(),
            );
          },
        );
      },
      child: BlocBuilder<DeviceConfigurationBloc, DeviceConfigurationState>(
        builder: (context, state) {
          return state.configStep.isFetchRemoteStep
              ? RemoteChangesFetcherWidget()
              : state.configStep.isSyncUpdatesStep
              ? SyncRemoteChangesWidget()
              : DeviceConfigurationForm();
        },
      ),
    );
  }
}
