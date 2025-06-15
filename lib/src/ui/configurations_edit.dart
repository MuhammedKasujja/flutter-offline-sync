import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/utils/extensions.dart';

class ConfigurationsEdit extends StatefulWidget {
  const ConfigurationsEdit({super.key});

  @override
  State<ConfigurationsEdit> createState() => _ConfigurationsEditState();
}

class _ConfigurationsEditState extends State<ConfigurationsEdit> {
  final baseUrlController = TextEditingController();
  final uploadUrlController = TextEditingController();
  final downloadUrlController = TextEditingController();
  final addDeviceUrlController = TextEditingController();

  @override
  void initState() {
    viewSaveSettings();
    super.initState();
  }

  void saveConfig() async {
    final config = AppConfig.instance.getSettings();
    config.baseUrl = baseUrlController.text;
    config.localEndpoint = uploadUrlController.text;
    config.remoteEndpoint = downloadUrlController.text;
    config.addSyncDeviceEndpoint = addDeviceUrlController.text;
    config.accountKey = "7ZAMZ52GZGOQU1570WLLB2Z4IKOQYS21";
    await AppConfig.instance.saveSettings(config);
    if (mounted) {
      context.toast.success('Settings saved successfully');
    }
  }

  Future viewSaveSettings() async {
    final settings = AppConfig.instance.getSettings();
    baseUrlController.text = settings.baseUrl ?? '';
    uploadUrlController.text = settings.localEndpoint ?? '';
    downloadUrlController.text = settings.remoteEndpoint ?? '';
    addDeviceUrlController.text = settings.addSyncDeviceEndpoint ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Remote Base Url'),
              TextFormField(controller: baseUrlController),
              Text('Uploads Url'),
              TextFormField(controller: uploadUrlController),
              Text('Downloads Url'),
              TextFormField(controller: downloadUrlController),
              Text('Add device Url'),
              TextFormField(controller: addDeviceUrlController),
              SizedBox(height: 10),
              Center(
                child: FilledButton(
                  onPressed: saveConfig,
                  child: Text('Save settings'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
