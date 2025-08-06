import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_offline_sync/src/blocs/device_configuration/device_configuration_bloc.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/device_configuration_form.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/remote_changes_fetcher.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/sync_remote_updates_widget.dart';

class DeviceConfiguration extends StatelessWidget {
  const DeviceConfiguration({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceConfigurationBloc, DeviceConfigurationState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.zero,
          child:
              state.configStep.isFetchRemoteStep
                  ? RemoteChangesFetcherWidget()
                  : state.configStep.isSyncUpdatesStep
                  ? SyncRemoteChangesWidget()
                  : DeviceConfigurationForm(),
        );
      },
    );
  }
}
