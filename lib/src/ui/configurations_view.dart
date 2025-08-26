import 'package:flutter/material.dart';

import 'package:flutter_offline_sync/src/ui/sync_devices_view.dart';
import 'package:flutter_offline_sync/src/utils/platforms.dart';

import 'configurations_edit.dart';
import 'data_viewer.dart';
import 'remote_data_preview.dart';

class SyncConfigurationsView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: isAdmin ? 3 : 2,
      child: Scaffold(
        endDrawer: Drawer(
          width: isDesktop(context) ? 500 : null,
          child: ConfigurationsEdit(
            canConfigApi: canConfigApi,
            syncUserId: syncUserId,
            isAdmin: isAdmin,
          ),
        ),
        appBar: AppBar(
          title: Text('Sync Configurations'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Local updates'),
              Tab(text: 'Remote Changes'),
              if (isAdmin) Tab(text: 'Devices'),
            ],
          ),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    if (isMobile(context)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ConfigurationsEdit(
                                canConfigApi: canConfigApi,
                                syncUserId: syncUserId,
                                isAdmin: isAdmin,
                              ),
                        ),
                      );
                    } else {
                      Scaffold.of(context).openEndDrawer();
                    }
                  },
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            SyncDataViewer(),
            RemoteDataPreviewWidget(),
            if (isAdmin) SyncDevicesView(),
          ],
        ),
      ),
    );
  }
}
