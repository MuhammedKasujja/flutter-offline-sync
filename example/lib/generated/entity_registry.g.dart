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
      query.close();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<RoleModel>().remove(id),
    updateFunction: (store, json) {
      RoleModel entity = RoleModel.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update RoleModel without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<RoleModel>();

      final query = box.query(RoleModel_.uuid.equals(entity.uuid!)).build();

      final model = query.findFirst();

      if (model != null) {
        entity.id = model.id;
      }

      query.close();
      entity = entity.applyJsonRelationships(store, json);
      entity.isSynced = true;
      return box.put(entity);
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
      query.close();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<UserModel>().remove(id),
    updateFunction: (store, json) {
      UserModel entity = UserModel.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update UserModel without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<UserModel>();

      final query = box.query(UserModel_.uuid.equals(entity.uuid!)).build();

      final model = query.findFirst();

      if (model != null) {
        entity.id = model.id;
      }

      query.close();
      entity = entity.applyJsonRelationships(store, json);
      entity.isSynced = true;
      return box.put(entity);
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
      query.close();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<PostModel>().remove(id),
    updateFunction: (store, json) {
      PostModel entity = PostModel.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update PostModel without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<PostModel>();

      final query = box.query(PostModel_.uuid.equals(entity.uuid!)).build();

      final model = query.findFirst();

      if (model != null) {
        entity.id = model.id;
      }

      query.close();
      entity = entity.applyJsonRelationships(store, json);
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
    map.addAll({"entityId": this.uuid});
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
        var postsEntity = PostModel.fromJson(data);

        final query = postsBox
            .query(PostModel_.uuid.equals(postsEntity.uuid!))
            .build();

        final model = query.findFirst();

        if (model != null) {
          postsEntity.id = model.id;
        } else {
          postsBox.put(postsEntity);
        }
        query.close();
        posts.add(postsEntity);
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
    map.addAll({"entityId": this.uuid});
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
    if (json.containsKey('user') && json['user'] != null) {
      var userEntity = UserModel.fromJson(json['user']);

      final userBox = store.box<UserModel>();
      final query = userBox
          .query(UserModel_.uuid.equals(userEntity.uuid!))
          .build();

      final data = query.findFirst();

      if (data != null) {
        userEntity.id = data.id;
      } else {
        userBox.put(userEntity);
      }
      query.close();
      user.target = userEntity;
    }

    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "PostModel"});
    map.addAll({"entityId": this.uuid});
    map.addAll({"state": "${operation.name}"});
    map.addAll({
      "data": {...toJson(), ...toRelationJson()},
    });
    return map;
  }
}

// dart format on
