import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/ui/sync_devices_view.dart';

import 'configurations_edit.dart';
import 'data_viewer.dart';

class SyncConfigurationsView extends StatelessWidget {
  const SyncConfigurationsView({super.key});

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
            IconButton(
              onPressed: () => ConfigService.resetSyncDates(),
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
