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
      final e = UserModel.fromJson(json);
      if (e.id == 0) throw Exception('Cannot update UserModel without ID');
      return store.box<UserModel>().put(e);
    },
  ),
  'PostModel': EntityHandler(
    boxFactory: (store) => store.box<PostModel>(),
    putFunction: (store, json) => store.box<PostModel>().put(PostModel.fromJson(json)),
    deleteFunction: (store, id) => store.box<PostModel>().remove(id),
    updateFunction: (store, json) {
      final e = PostModel.fromJson(json);
      if (e.id == 0) throw Exception('Cannot update PostModel without ID');
      return store.box<PostModel>().put(e);
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


  void applyRelationJson(Map<String, dynamic> json, Store store) {
    if (json.containsKey('postsIds')) {
      posts.clear();
      final postsBox = store.box<PostModel>();
      for (final id in json['postsIds']) {
        final item = postsBox.get(id);
        if (item != null) posts.add(item);
      }
    }
  }
  }


extension PostModelRelationJson on PostModel {
  Map<String, dynamic> toRelationJson() => {
    'userId': user.targetId,
  };


  void applyRelationJson(Map<String, dynamic> json, Store store) {
    if (json.containsKey('userId')) user.targetId = json['userId'];
  }
  }


// dart format on
