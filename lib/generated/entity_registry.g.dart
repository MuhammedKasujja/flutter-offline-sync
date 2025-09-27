// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

//**************************************************************************
// FlutterSyncGenerator
//**************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint, unused_local_variable

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/generator/entity_registry.dart';
import 'package:flutter_offline_sync/objectbox.g.dart';
import 'package:flutter_offline_sync/src/data/models/remote_update_entity.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/configuration_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';

final Map<String, EntityHandler> _generatedRegistry = {
  'RemoteUpdateEntity': EntityHandler(
    boxFactory: (store) => store.box<RemoteUpdateEntity>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<RemoteUpdateEntity>();
      final query = box
          .query(
            RemoteUpdateEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(RemoteUpdateEntity_.isSynced.equals(false)),
          )
          .order(RemoteUpdateEntity_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      query.close();
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<RemoteUpdateEntity>();
      final query = box
          .query(
            RemoteUpdateEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(RemoteUpdateEntity_.isSynced.equals(false)),
          )
          .order(RemoteUpdateEntity_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<RemoteUpdateEntity>();
      final query = box
          .query(
            RemoteUpdateEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(RemoteUpdateEntity_.isSynced.equals(false)),
          )
          .order(RemoteUpdateEntity_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
    },
    deleteFunction: (store, id) => store.box<RemoteUpdateEntity>().remove(id),
    updateFunction: (store, json) {
      RemoteUpdateEntity entity = RemoteUpdateEntity.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update RemoteUpdateEntity without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<RemoteUpdateEntity>();

      final query = box
          .query(RemoteUpdateEntity_.uuid.equals(entity.uuid!))
          .build();

      final model = query.findFirst();

      if (model != null) {
        entity.id = model.id;
      }

      query.close();
      if (json['relations'] != null) {
        entity = entity.applyJsonRelationships(store, json['relations'] ?? {});
      }
      // Ensure isSynced is set to true to avoid sync issues

      entity.isSynced = true;
      return box.put(entity);
    },
  ),
  'DataEntity': EntityHandler(
    boxFactory: (store) => store.box<DataEntity>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<DataEntity>();
      final query = box
          .query(
            DataEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(DataEntity_.isSynced.equals(false)),
          )
          .order(DataEntity_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      query.close();
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<DataEntity>();
      final query = box
          .query(
            DataEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(DataEntity_.isSynced.equals(false)),
          )
          .order(DataEntity_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<DataEntity>();
      final query = box
          .query(
            DataEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(DataEntity_.isSynced.equals(false)),
          )
          .order(DataEntity_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
    },
    deleteFunction: (store, id) => store.box<DataEntity>().remove(id),
    updateFunction: (store, json) {
      DataEntity entity = DataEntity.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update DataEntity without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<DataEntity>();

      final query = box.query(DataEntity_.uuid.equals(entity.uuid!)).build();

      final model = query.findFirst();

      if (model != null) {
        entity.id = model.id;
      }

      query.close();
      if (json['relations'] != null) {
        entity = entity.applyJsonRelationships(store, json['relations'] ?? {});
      }
      // Ensure isSynced is set to true to avoid sync issues

      entity.isSynced = true;
      return box.put(entity);
    },
  ),
  'ConfigurationEntity': EntityHandler(
    boxFactory: (store) => store.box<ConfigurationEntity>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<ConfigurationEntity>();
      final query = box
          .query(
            ConfigurationEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(ConfigurationEntity_.isSynced.equals(false)),
          )
          .order(ConfigurationEntity_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      query.close();
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<ConfigurationEntity>();
      final query = box
          .query(
            ConfigurationEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(ConfigurationEntity_.isSynced.equals(false)),
          )
          .order(ConfigurationEntity_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<ConfigurationEntity>();
      final query = box
          .query(
            ConfigurationEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(ConfigurationEntity_.isSynced.equals(false)),
          )
          .order(ConfigurationEntity_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
    },
    deleteFunction: (store, id) => store.box<ConfigurationEntity>().remove(id),
    updateFunction: (store, json) {
      ConfigurationEntity entity = ConfigurationEntity.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update ConfigurationEntity without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<ConfigurationEntity>();

      final query = box
          .query(ConfigurationEntity_.uuid.equals(entity.uuid!))
          .build();

      final model = query.findFirst();

      if (model != null) {
        entity.id = model.id;
      }

      query.close();
      if (json['relations'] != null) {
        entity = entity.applyJsonRelationships(store, json['relations'] ?? {});
      }
      // Ensure isSynced is set to true to avoid sync issues

      entity.isSynced = true;
      return box.put(entity);
    },
  ),
  'SyncDeviceEntity': EntityHandler(
    boxFactory: (store) => store.box<SyncDeviceEntity>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<SyncDeviceEntity>();
      final query = box
          .query(
            SyncDeviceEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(SyncDeviceEntity_.isSynced.equals(false)),
          )
          .order(SyncDeviceEntity_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      query.close();
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<SyncDeviceEntity>();
      final query = box
          .query(
            SyncDeviceEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(SyncDeviceEntity_.isSynced.equals(false)),
          )
          .order(SyncDeviceEntity_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<SyncDeviceEntity>();
      final query = box
          .query(
            SyncDeviceEntity_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(SyncDeviceEntity_.isSynced.equals(false)),
          )
          .order(SyncDeviceEntity_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
    },
    deleteFunction: (store, id) => store.box<SyncDeviceEntity>().remove(id),
    updateFunction: (store, json) {
      SyncDeviceEntity entity = SyncDeviceEntity.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update SyncDeviceEntity without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<SyncDeviceEntity>();

      final query = box
          .query(SyncDeviceEntity_.uuid.equals(entity.uuid!))
          .build();

      final model = query.findFirst();

      if (model != null) {
        entity.id = model.id;
      }

      query.close();
      if (json['relations'] != null) {
        entity = entity.applyJsonRelationships(store, json['relations'] ?? {});
      }
      // Ensure isSynced is set to true to avoid sync issues

      entity.isSynced = true;
      return box.put(entity);
    },
  ),
};

final class ObjectboxSyncRegistry extends EntityRegistry {
  ObjectboxSyncRegistry(super.store);

  @override
  EntityHandler? get(String name) => _generatedRegistry[name];

  @override
  List<String> getAllEntities() => _generatedRegistry.keys.toList();
}

// GENERATED TORELATIONJSON EXTENSIONS
extension RemoteUpdateEntityRelationJson on RemoteUpdateEntity {
  Map<String, dynamic> toRelationJson() => {};

  RemoteUpdateEntity applyJsonRelationships(
    Store store,
    Map<String, dynamic> json,
  ) {
    // Apply relations from JSON
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "RemoteUpdateEntity"});
    map.addAll({"entityId": this.uuid});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {
        ...toJson(),
        ...{"relations": toRelationJson()},
      },
    });
    return map;
  }
}

extension DataEntityRelationJson on DataEntity {
  Map<String, dynamic> toRelationJson() => {};

  DataEntity applyJsonRelationships(Store store, Map<String, dynamic> json) {
    // Apply relations from JSON
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "DataEntity"});
    map.addAll({"entityId": this.uuid});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {
        ...toJson(),
        ...{"relations": toRelationJson()},
      },
    });
    return map;
  }
}

extension ConfigurationEntityRelationJson on ConfigurationEntity {
  Map<String, dynamic> toRelationJson() => {};

  ConfigurationEntity applyJsonRelationships(
    Store store,
    Map<String, dynamic> json,
  ) {
    // Apply relations from JSON
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "ConfigurationEntity"});
    map.addAll({"entityId": this.uuid});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {
        ...toJson(),
        ...{"relations": toRelationJson()},
      },
    });
    return map;
  }
}

extension SyncDeviceEntityRelationJson on SyncDeviceEntity {
  Map<String, dynamic> toRelationJson() => {};

  SyncDeviceEntity applyJsonRelationships(
    Store store,
    Map<String, dynamic> json,
  ) {
    // Apply relations from JSON
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "SyncDeviceEntity"});
    map.addAll({"entityId": this.uuid});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {
        ...toJson(),
        ...{"relations": toRelationJson()},
      },
    });
    return map;
  }
}

// dart format on
