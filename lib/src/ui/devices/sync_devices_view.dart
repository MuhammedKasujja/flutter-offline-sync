import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class SyncDevicesView extends StatefulWidget {
  const SyncDevicesView({super.key});

  @override
  State<SyncDevicesView> createState() => _SyncDevicesViewState();
}

class _SyncDevicesViewState extends State<SyncDevicesView> {
  @override
  void initState() {
    context.read<SyncDeviceBloc>().add(SyncDeviceEvent.fetchRemoteDevices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SyncDeviceBloc, SyncDeviceState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (error, _) {
              context.toast.error(error);
            },
          );
        },
        builder: (context, state) {
          if (state.data.isNotEmpty) {
            return SyncDeviceList(devices: state.data);
          }
          return state.maybeWhen(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            failure: (error, _) => Center(child: Text('$error')),
            success: (data) {
              if (data.isEmpty) {
                return Center(child: Text('No Sync Devices Found'));
              }
              return SyncDeviceList(devices: data);
            },
            orElse: () => Center(child: Text('No Sync Devices Found')),
          );
        },
      ),
    );
  }
}

class SyncDeviceList extends StatelessWidget {
  const SyncDeviceList({super.key, required this.devices});

  final List<SyncDeviceEntity> devices;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return ListTile(
          title: Text(device.userName),
          subtitle: Text(
            'Last Synced: ${device.lastSyncDate != null ? formatDate(device.lastSyncDate!.toLocal()) : 'Never'}',
          ),
          trailing: Icon(
            device.isActive ? Icons.check_circle : Icons.cancel,
            color: device.isActive ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }
}
