import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_offline_sync/src/blocs/local_updates/local_updates_bloc.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/ui/sync_devices_view.dart';

import 'configurations_edit.dart';
import 'data_viewer.dart';

class SyncConfigurationsView extends StatefulWidget {
  const SyncConfigurationsView({
    super.key,
    required this.isAdmin,
    required this.canConfigApi,
    required this.syncUserId,
  });

  /// Admin accounts can reset last syncronization dates
  final bool isAdmin;

  /// Allow changing sync API endpoints
  final bool canConfigApi;

  ///  `syncUserId` to track the user making data syncronization
  final String? syncUserId;

  @override
  State<SyncConfigurationsView> createState() => _SyncConfigurationsViewState();
}

class _SyncConfigurationsViewState extends State<SyncConfigurationsView> {
  Future<void> handleDataReset() async {
    await ConfigService.resetSyncDates();
    if (mounted) {
      context.read<LocalUpdatesBloc>().add(FetchLocalChanges());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.isAdmin ? 3 : 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sync Configurations'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Local updates'),
              Tab(text: 'Config'),
              if (widget.isAdmin) Tab(text: 'Devices'),
            ],
          ),
          actions: [
            if (widget.isAdmin)
              IconButton(
                onPressed: handleDataReset,
                icon: Icon(Icons.restore_outlined),
                tooltip: 'Reset Sync Dates',
              ),
          ],
        ),
        body: TabBarView(
          children: [
            SyncDataViewer(),
            ConfigurationsEdit(
              canConfigApi: widget.canConfigApi,
              syncUserId: widget.syncUserId,
            ),
            if (widget.isAdmin) SyncDevicesView(),
          ],
        ),
      ),
    );
  }
}
