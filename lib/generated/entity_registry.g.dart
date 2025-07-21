// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// GENERATED CODE - DO NOT MODIFY BY HAND

//**************************************************************************
// FlutterSyncGenerator
//**************************************************************************

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:objectbox/objectbox.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/configuration_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';

final Map<String, EntityHandler> _generatedRegistry = {
  'DataEntity': EntityHandler(
    boxFactory: (store) => store.box<DataEntity>(),
    fetchFunction: (store, lastSync) {
      final updates = store.box<DataEntity>().getAll();
      return updates.map((ele)=>ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<DataEntity>().remove(id),
    updateFunction: (store, json) {
      DataEntity entity = DataEntity.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update DataEntity without ID');
      entity = entity.applyRelationJson(store);
      return store.box<DataEntity>().put(entity);
    },
  ),
  'ConfigurationEntity': EntityHandler(
    boxFactory: (store) => store.box<ConfigurationEntity>(),
    fetchFunction: (store, lastSync) {
      final updates = store.box<ConfigurationEntity>().getAll();
      return updates.map((ele)=>ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<ConfigurationEntity>().remove(id),
    updateFunction: (store, json) {
      ConfigurationEntity entity = ConfigurationEntity.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update ConfigurationEntity without ID');
      entity = entity.applyRelationJson(store);
      return store.box<ConfigurationEntity>().put(entity);
    },
  ),
  'SyncDeviceEntity': EntityHandler(
    boxFactory: (store) => store.box<SyncDeviceEntity>(),
    fetchFunction: (store, lastSync) {
      final updates = store.box<SyncDeviceEntity>().getAll();
      return updates.map((ele)=>ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<SyncDeviceEntity>().remove(id),
    updateFunction: (store, json) {
      SyncDeviceEntity entity = SyncDeviceEntity.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update SyncDeviceEntity without ID');
      entity = entity.applyRelationJson(store);
      return store.box<SyncDeviceEntity>().put(entity);
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

// GENERATED TORELATIONJSON EXTENSIONS
extension DataEntityRelationJson on DataEntity {
  Map<String, dynamic> toRelationJson() => {
  };


  DataEntity applyRelationJson(Store store) {
    // Apply relations from JSON
    final json = toRelationJson();
  return this;
  }


  Map<String, dynamic> toSyncJson() => {
    ...toJson(),
    ...toRelationJson()
  };
  }


extension ConfigurationEntityRelationJson on ConfigurationEntity {
  Map<String, dynamic> toRelationJson() => {
  };


  ConfigurationEntity applyRelationJson(Store store) {
    // Apply relations from JSON
    final json = toRelationJson();
  return this;
  }


  Map<String, dynamic> toSyncJson() => {
    ...toJson(),
    ...toRelationJson()
  };
  }


extension SyncDeviceEntityRelationJson on SyncDeviceEntity {
  Map<String, dynamic> toRelationJson() => {
  };


  SyncDeviceEntity applyRelationJson(Store store) {
    // Apply relations from JSON
    final json = toRelationJson();
  return this;
  }


  Map<String, dynamic> toSyncJson() => {
    ...toJson(),
    ...toRelationJson()
  };
  }


// dart format on
