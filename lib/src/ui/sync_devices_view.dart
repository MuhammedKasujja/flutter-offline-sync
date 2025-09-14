import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';

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
    return Scaffold(body: Center(child: Text('Sync Devices View...')));
  }
}
