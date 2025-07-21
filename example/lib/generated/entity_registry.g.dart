// dart format width=80
// ignore_for_file: type=lint, unused_local_variable
// GENERATED CODE - DO NOT MODIFY BY HAND
// GENERATED CODE - DO NOT MODIFY BY HAND

//**************************************************************************
// FlutterSyncGenerator
//**************************************************************************

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:example/objectbox.g.dart';
import 'package:example/data/models/user_model.dart';
import 'package:example/data/models/post_model.dart';

final Map<String, EntityHandler> _generatedRegistry = {
  'UserModel': EntityHandler(
    boxFactory: (store) => store.box<UserModel>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<UserModel>();
      final query = box
          .query(
            UserModel_.updatedAt.greaterThan(lastSync.millisecondsSinceEpoch),
          )
          .build();
      final updates = query.find();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<UserModel>().remove(id),
    updateFunction: (store, json) {
      UserModel entity = UserModel.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update UserModel without ID');
      entity = entity.applyRelationJson(store);
      return store.box<UserModel>().put(entity);
    },
  ),
  'PostModel': EntityHandler(
    boxFactory: (store) => store.box<PostModel>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<PostModel>();
      final query = box
          .query(
            PostModel_.updatedAt.greaterThan(lastSync.millisecondsSinceEpoch),
          )
          .build();
      final updates = query.find();
      return updates.map((ele) => ele.toSyncJson()).toList();
    },
    deleteFunction: (store, id) => store.box<PostModel>().remove(id),
    updateFunction: (store, json) {
      PostModel entity = PostModel.fromJson(json);
      if (entity.id == 0) throw Exception('Cannot update PostModel without ID');
      entity = entity.applyRelationJson(store);
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
extension UserModelRelationJson on UserModel {
  Map<String, dynamic> toRelationJson() => {
    'postsIds': posts.map((e) => e.id).toList(),
  };

  UserModel applyRelationJson(Store store) {
    // Apply relations from JSON
    final json = toRelationJson();
    if (json.containsKey('postsIds')) {
      posts.clear();
      final postsBox = store.box<PostModel>();
      for (final id in json['postsIds']) {
        final item = postsBox.get(id);
        if (item != null) posts.add(item);
      }
    }
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = createdAt.syncState(updatedAt);
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
  Map<String, dynamic> toRelationJson() => {'userId': user.targetId};

  PostModel applyRelationJson(Store store) {
    // Apply relations from JSON
    final json = toRelationJson();
    if (json.containsKey('userId')) user.targetId = json['userId'];
    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = createdAt.syncState(updatedAt);
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
