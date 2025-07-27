import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_offline_sync/src/providers/register_device.dart';
import 'package:flutter_offline_sync/src/providers/remote_data_updates.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/device_configuration_form.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/remote_changes_fetcher.dart';
import 'package:flutter_offline_sync/src/ui/device_configuration/widgets/sync_remote_updates_widget.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class DeviceConfiguration extends ConsumerStatefulWidget {
  const DeviceConfiguration({super.key});

  @override
  ConsumerState<DeviceConfiguration> createState() =>
      _DeviceConfigurationState();
}

class _DeviceConfigurationState extends ConsumerState<DeviceConfiguration> {
  Widget child = DeviceConfigurationForm();
  @override
  Widget build(BuildContext context) {
    // Ensure listeners are only set up once
    // if (!_didSetupListeners) {
    //   _didSetupListeners = true;
    ref.listen(registerDeviceProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          context.toast.success('Device registered Successfully!');
          ref.read(remoteDataUpdatesProvider.notifier).fetchUpdates();
          setState(() {
            child = RemoteChangesFetcherWidget();
          });
        },
        error: (e, _) => context.toast.error('$e'),
      );
    });
    ref.listen(remoteDataUpdatesProvider, (prev, next) {
      next.whenOrNull(
        data: (remoteUpdates) {
          context.toast.success('Remote updates fetched');
          if (remoteUpdates.isNotEmpty) {
            ref
                .read(syncRemoteUpdatesProvider.notifier)
                .syncUpdates(remoteUpdates);
            setState(() {
              child = SyncRemoteChangesWidget();
            });
          }
        },
        error: (e, _) => context.toast.error('$e'),
      );
    });
    // }
    return child;
  }
}
