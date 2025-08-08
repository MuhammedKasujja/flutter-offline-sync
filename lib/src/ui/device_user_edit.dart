import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/remote_config_service.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class DeviceUserEdit extends StatefulWidget {
  const DeviceUserEdit({super.key});

  @override
  State<DeviceUserEdit> createState() => _DeviceUserEditState();
}

class _DeviceUserEditState extends State<DeviceUserEdit> {
  final deviceIdController = TextEditingController();
  final userNameController = TextEditingController();

  void handleSaveDevice() async {
    final repo = RemoteConfigService(apiClient: AppConfig.instance.getClient());
    try {
      final response = await repo.syncCurrentDevice(
        userId: 'userId', // Replace with actual user ID
        // deviceId: deviceIdController.text,
        userName: userNameController.text.trim(),
        syncUrl: '',
        accountKey: '',
      );
      if (response.isSuccess) {
        context.toast.success('Device saved successfully');
      } else {
        context.toast.error('${response.error}');
      }
    } catch (error) {
      context.toast.error('Error saving device: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Sync Device')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Name'),
              TextFormField(controller: userNameController),
              Text('Device ID'),
              TextFormField(controller: deviceIdController,enabled: false),
              SizedBox(height: 10),
              Center(
                child: FilledButton(
                  onPressed: handleSaveDevice,
                  child: Text('Save Device'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
