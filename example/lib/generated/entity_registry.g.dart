// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// GENERATED CODE - DO NOT MODIFY BY HAND

//**************************************************************************
// FlutterSyncGenerator
//**************************************************************************

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:objectbox/objectbox.dart';
import 'package:example/data/models/user_model.dart';
import 'package:example/data/models/post_model.dart';

final Map<String, EntityHandler> _generatedRegistry = {
  'UserModel': EntityHandler(
    boxFactory: (store) => store.box<UserModel>(),
    putFunction: (store, json) => store.box<UserModel>().put(UserModel.fromJson(json)),
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
    putFunction: (store, json) => store.box<PostModel>().put(PostModel.fromJson(json)),
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
  List<String>  getAllEntities() => _generatedRegistry.keys.toList();
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


  Map<String, dynamic> toSyncJson() => {
    ...toJson(),
    ...toRelationJson()
  };
  }


extension PostModelRelationJson on PostModel {
  Map<String, dynamic> toRelationJson() => {
    'userId': user.targetId,
  };


  PostModel applyRelationJson(Store store) {
    // Apply relations from JSON
    final json = toRelationJson();
    if (json.containsKey('userId')) user.targetId = json['userId'];
  return this;
  }


  Map<String, dynamic> toSyncJson() => {
    ...toJson(),
    ...toRelationJson()
  };
  }


// dart format on
