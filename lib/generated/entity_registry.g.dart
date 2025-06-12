// GENERATED CODE - DO NOT MODIFY BY HAND

//**************************************************************************
// FlutterSyncGenerator
//**************************************************************************

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/configuration_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';

final Map<String, EntityHandler> _generatedRegistry = {
  'DataEntity': EntityHandler(
    boxFactory: (store) => store.box<DataEntity>(),
    putFunction: (store, json) => store.box<DataEntity>().put(DataEntity.fromJson(json)),
    deleteFunction: (store, id) => store.box<DataEntity>().remove(id),
    updateFunction: (store, json) {
      final e = DataEntity.fromJson(json);
      if (e.id == 0) throw Exception('Cannot update DataEntity without ID');
      return store.box<DataEntity>().put(e);
    },
  ),
  'ConfigurationEntity': EntityHandler(
    boxFactory: (store) => store.box<ConfigurationEntity>(),
    putFunction: (store, json) => store.box<ConfigurationEntity>().put(ConfigurationEntity.fromJson(json)),
    deleteFunction: (store, id) => store.box<ConfigurationEntity>().remove(id),
    updateFunction: (store, json) {
      final e = ConfigurationEntity.fromJson(json);
      if (e.id == 0) throw Exception('Cannot update ConfigurationEntity without ID');
      return store.box<ConfigurationEntity>().put(e);
    },
  ),
  'SyncDeviceEntity': EntityHandler(
    boxFactory: (store) => store.box<SyncDeviceEntity>(),
    putFunction: (store, json) => store.box<SyncDeviceEntity>().put(SyncDeviceEntity.fromJson(json)),
    deleteFunction: (store, id) => store.box<SyncDeviceEntity>().remove(id),
    updateFunction: (store, json) {
      final e = SyncDeviceEntity.fromJson(json);
      if (e.id == 0) throw Exception('Cannot update SyncDeviceEntity without ID');
      return store.box<SyncDeviceEntity>().put(e);
    },
  ),
};

final class ObjectboxSyncRegistry extends EntityRegistry {
  ObjectboxSyncRegistry(super.store);

  @override
  EntityHandler? get(String name) => _generatedRegistry[name];

  @override
  List<String>  getAllEntities() => _generatedRegistry.keys.toList();
}
