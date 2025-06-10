import 'package:flutter/material.dart';

import 'configurations_edit.dart';
import 'data_viewer.dart';

class SyncConfigurationsView extends StatelessWidget {
  const SyncConfigurationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sync Configurations'),
          bottom: TabBar(
            tabs: [Tab(text: 'Local updates'), Tab(text: 'Config')],
          ),
        ),
        body: TabBarView(children: [SyncDataViewer(), ConfigurationsEdit()]),
      ),
    );
  }
}
