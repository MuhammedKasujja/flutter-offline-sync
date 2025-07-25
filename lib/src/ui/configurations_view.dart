import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/providers/local_data_updates.dart';
import 'package:flutter_offline_sync/src/ui/sync_devices_view.dart';

import 'configurations_edit.dart';
import 'data_viewer.dart';

class SyncConfigurationsView extends ConsumerStatefulWidget {
  const SyncConfigurationsView({super.key, required this.isAdmin});
  final bool isAdmin;

  @override
  ConsumerState<SyncConfigurationsView> createState() =>
      _SyncConfigurationsViewState();
}

class _SyncConfigurationsViewState
    extends ConsumerState<SyncConfigurationsView> {
  Future<void> handleDataReset() async {
    await ConfigService.resetSyncDates();
    ref.read(localDataUpdatesProvider.notifier).fetchLocalUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sync Configurations'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Local updates'),
              Tab(text: 'Config'),
              Tab(text: 'Devices'),
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
          children: [SyncDataViewer(), ConfigurationsEdit(), SyncDevicesView()],
        ),
      ),
    );
  }
}
