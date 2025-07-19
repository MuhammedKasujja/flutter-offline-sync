import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/ui/device_user_edit.dart';

class SyncDevicesView extends StatelessWidget {
  const SyncDevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Sync Devices View')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Device',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeviceUserEdit()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
