import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/data/models/models.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';

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

  void saveConfig() {
    final config = ConfigurationEntity();
    config.baseUrl = baseUrlController.text;
    config.localEndpoint = uploadUrlController.text;
    config.remoteEndpoint = downloadUrlController.text;
    config.addSyncDeviceEndpoint = addDeviceUrlController.text;
    ConfigService.saveSettings(config);
  }

  Future viewSaveSettings() async {
    final config = await ConfigService.getSettings();
    baseUrlController.text = config?.baseUrl ?? '';
    uploadUrlController.text = config?.localEndpoint ?? '';
    downloadUrlController.text = config?.remoteEndpoint ?? '';
    addDeviceUrlController.text = config?.addSyncDeviceEndpoint ?? '';
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
