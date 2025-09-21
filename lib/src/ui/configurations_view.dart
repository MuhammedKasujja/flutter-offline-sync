import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';

import 'package:flutter_offline_sync/src/ui/devices/sync_devices_view.dart';
import 'package:flutter_offline_sync/src/utils/platforms.dart';

import 'configurations_edit.dart';
import 'data_viewer.dart';
import 'remote_data_preview.dart';

class SyncConfigurationsView extends StatefulWidget {
  const SyncConfigurationsView({
    super.key,
    required this.isAdmin,
    required this.canConfigApi,
    required this.syncUserId,
    this.viewLocalAsJson = false,
  });

  /// Admin accounts can reset last syncronization dates
  final bool isAdmin;

  /// view local updates in JSON format and only if `kDataPreviewThreshold`
  final bool viewLocalAsJson;

  /// Allow changing sync API endpoints
  final bool canConfigApi;

  ///  `syncUserId` to track the user making data syncronization
  final String? syncUserId;

  @override
  State<SyncConfigurationsView> createState() => _SyncConfigurationsViewState();
}

class _SyncConfigurationsViewState extends State<SyncConfigurationsView> {
  @override
  void initState() {
    checkUnSavedChanges();
    fetchLocalDevices();
    super.initState();
  }

  void checkUnSavedChanges() {
    context.read<SyncUpdateBloc>().add(StageRemoteChanges());
  }

  void fetchLocalDevices() {
    context.read<SyncDeviceBloc>().add(SyncDeviceEvent.fetchLocalDevices());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.isAdmin ? 3 : 2,
      child: Scaffold(
        endDrawer:
            isDesktop(context)
                ? Drawer(
                  width: 500,
                  child: ConfigurationsEdit(
                    canConfigApi: widget.canConfigApi,
                    syncUserId: widget.syncUserId,
                    isAdmin: widget.isAdmin,
                  ),
                )
                : null,
        appBar: AppBar(
          title: Text('Sync Configurations'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Local updates'),
              Tab(text: 'Remote Changes'),
              if (widget.isAdmin) Tab(text: 'Devices'),
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
                                canConfigApi: widget.canConfigApi,
                                syncUserId: widget.syncUserId,
                                isAdmin: widget.isAdmin,
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
            SyncDataViewer(viewJson: widget.viewLocalAsJson),
            RemoteDataPreviewWidget(),
            if (widget.isAdmin) SyncDevicesView(),
          ],
        ),
      ),
    );
  }
}
