// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

//**************************************************************************
// FlutterSyncGenerator
//**************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint, unused_local_variable

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/generator/entity_registry.dart';
import 'package:example/objectbox.g.dart';
import 'package:example/data/models/role_model.dart';
import 'package:example/data/models/user_model.dart';
import 'package:example/data/models/post_model.dart';

final Map<String, EntityHandler> _generatedRegistry = {
  'RoleModel': EntityHandler(
    boxFactory: (store) => store.box<RoleModel>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<RoleModel>();
      final query = box
          .query(
            RoleModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(RoleModel_.isSynced.equals(false)),
          )
          .order(RoleModel_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<RoleModel>().remove(id),
    updateFunction: (store, json) {
      RoleModel entity = RoleModel.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update RoleModel without ID');
      entity = entity.applyJsonRelationships(store, json);
      entity.isSynced = true;
      return store.box<RoleModel>().put(entity);
    },
  ),
  'UserModel': EntityHandler(
    boxFactory: (store) => store.box<UserModel>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<UserModel>();
      final query = box
          .query(
            UserModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(UserModel_.isSynced.equals(false)),
          )
          .order(UserModel_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<UserModel>().remove(id),
    updateFunction: (store, json) {
      UserModel entity = UserModel.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update UserModel without ID');
      entity = entity.applyJsonRelationships(store, json);
      entity.isSynced = true;
      return store.box<UserModel>().put(entity);
    },
  ),
  'PostModel': EntityHandler(
    boxFactory: (store) => store.box<PostModel>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<PostModel>();
      final query = box
          .query(
            PostModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(PostModel_.isSynced.equals(false)),
          )
          .order(PostModel_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<PostModel>().remove(id),
    updateFunction: (store, json) {
      PostModel entity = PostModel.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update PostModel without ID');
      entity = entity.applyJsonRelationships(store, json);
      entity.isSynced = true;
      return store.box<PostModel>().put(entity);
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
extension RoleModelRelationJson on RoleModel {
  Map<String, dynamic> toRelationJson() => {};

  RoleModel applyJsonRelationships(Store store, Map<String, dynamic> json) {
    // Apply relations from JSON
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "RoleModel"});
    map.addAll({"entityId": this.id});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {...toJson(), ...toRelationJson()},
    });
    return map;
  }
}

extension UserModelRelationJson on UserModel {
  Map<String, dynamic> toRelationJson() => {
    'posts': posts.map((e) => e.toJson()).toList(),
  };

  UserModel applyJsonRelationships(Store store, Map<String, dynamic> json) {
    // Apply relations from JSON
    if (json.containsKey('posts')) {
      posts.clear();
      final postsBox = store.box<PostModel>();
      for (final data in json['posts']) {
        final item = PostModel.fromJson(data);
        posts.add(item);
      }
    }
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "UserModel"});
    map.addAll({"entityId": this.id});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {...toJson(), ...toRelationJson()},
    });
    return map;
  }
}

extension PostModelRelationJson on PostModel {
  Map<String, dynamic> toRelationJson() => {'user': user.target?.toJson()};

  PostModel applyJsonRelationships(Store store, Map<String, dynamic> json) {
    // Apply relations from JSON
    if (json.containsKey('user') && json['user'] != null)
      user.target = UserModel.fromJson(json['user']);
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "PostModel"});
    map.addAll({"entityId": this.id});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {...toJson(), ...toRelationJson()},
    });
    return map;
  }
}

// dart format on
