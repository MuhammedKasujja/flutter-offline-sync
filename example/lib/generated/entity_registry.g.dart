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
import 'package:example/data/models/comment_model.dart';

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
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<RoleModel>();
      final query = box
          .query(
            RoleModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(RoleModel_.isSynced.equals(false)),
          )
          .order(RoleModel_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<RoleModel>();
      final query = box
          .query(
            RoleModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(RoleModel_.isSynced.equals(false)),
          )
          .order(RoleModel_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
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
      if (json['relations'] != null) {
        entity = entity.applyJsonRelationships(store, json['relations'] ?? {});
      }
      // Ensure isSynced is set to true to avoid sync issues

      entity.isSynced = true;
      return box.put(entity);
    },
    saveRelationsFunction: (store, json) {
      final box = store.box<RoleModel>();

      final query = box.query(RoleModel_.uuid.equals(json['uuid'])).build();

      RoleModel? entity = query.findFirst();

      query.close();

      if (entity != null) {
        if (json['relations'] != null) {
          entity = entity.applyJsonRelationships(
            store,
            json['relations'] ?? {},
          );
        }
        // Ensure isSynced is set to true to avoid sync issues
        entity.isSynced = true;
        return box.put(entity);
      }
      return 0;
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
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<UserModel>();
      final query = box
          .query(
            UserModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(UserModel_.isSynced.equals(false)),
          )
          .order(UserModel_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<UserModel>();
      final query = box
          .query(
            UserModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(UserModel_.isSynced.equals(false)),
          )
          .order(UserModel_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
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
      if (json['relations'] != null) {
        entity = entity.applyJsonRelationships(store, json['relations'] ?? {});
      }
      // Ensure isSynced is set to true to avoid sync issues

      entity.isSynced = true;
      return box.put(entity);
    },
    saveRelationsFunction: (store, json) {
      final box = store.box<UserModel>();

      final query = box.query(UserModel_.uuid.equals(json['uuid'])).build();

      UserModel? entity = query.findFirst();

      query.close();

      if (entity != null) {
        if (json['relations'] != null) {
          entity = entity.applyJsonRelationships(
            store,
            json['relations'] ?? {},
          );
        }
        // Ensure isSynced is set to true to avoid sync issues
        entity.isSynced = true;
        return box.put(entity);
      }
      return 0;
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
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<PostModel>();
      final query = box
          .query(
            PostModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(PostModel_.isSynced.equals(false)),
          )
          .order(PostModel_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<PostModel>();
      final query = box
          .query(
            PostModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(PostModel_.isSynced.equals(false)),
          )
          .order(PostModel_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
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
      if (json['relations'] != null) {
        entity = entity.applyJsonRelationships(store, json['relations'] ?? {});
      }
      // Ensure isSynced is set to true to avoid sync issues

      entity.isSynced = true;
      return box.put(entity);
    },
    saveRelationsFunction: (store, json) {
      final box = store.box<PostModel>();

      final query = box.query(PostModel_.uuid.equals(json['uuid'])).build();

      PostModel? entity = query.findFirst();

      query.close();

      if (entity != null) {
        if (json['relations'] != null) {
          entity = entity.applyJsonRelationships(
            store,
            json['relations'] ?? {},
          );
        }
        // Ensure isSynced is set to true to avoid sync issues
        entity.isSynced = true;
        return box.put(entity);
      }
      return 0;
    },
  ),
  'CommentModel': EntityHandler(
    boxFactory: (store) => store.box<CommentModel>(),
    fetchFunction: (store, lastSync) {
      final box = store.box<CommentModel>();
      final query = box
          .query(
            CommentModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(CommentModel_.isSynced.equals(false)),
          )
          .order(CommentModel_.updatedAt, flags: Order.descending)
          .build();
      final updates = query.find();
      query.close();
      return updates.map((ele) => {...ele.toSyncJson()}).toList();
    },
    fetchUpdatedIdsFunction: (store, lastSync) {
      final box = store.box<CommentModel>();
      final query = box
          .query(
            CommentModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(CommentModel_.isSynced.equals(false)),
          )
          .order(CommentModel_.updatedAt, flags: Order.descending)
          .build();
      final ids = query.findIds();
      query.close();
      return ids;
    },
    makeEntitiesAsSyncronizedFunction: (store, lastSync) {
      final box = store.box<CommentModel>();
      final query = box
          .query(
            CommentModel_.updatedAt
                .greaterThan(lastSync.millisecondsSinceEpoch)
                .and(CommentModel_.isSynced.equals(false)),
          )
          .order(CommentModel_.updatedAt, flags: Order.descending)
          .build();
      final entities = query.find();
      for (var entity in entities) {
        entity.isSynced = true;
        box.put(entity);
      }
      query.close();
      return entities.length;
    },
    deleteFunction: (store, id) => store.box<CommentModel>().remove(id),
    updateFunction: (store, json) {
      CommentModel entity = CommentModel.fromJson(json);
      if ((entity.uuid ?? '').isEmpty)
        throw Exception('Cannot update CommentModel without ID');

      /// explictly set [id] to zero to avoid local db primary key out of sequence error
      entity.id = 0;

      final box = store.box<CommentModel>();

      final query = box.query(CommentModel_.uuid.equals(entity.uuid!)).build();

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
    saveRelationsFunction: (store, json) {
      final box = store.box<CommentModel>();

      final query = box.query(CommentModel_.uuid.equals(json['uuid'])).build();

      CommentModel? entity = query.findFirst();

      query.close();

      if (entity != null) {
        if (json['relations'] != null) {
          entity = entity.applyJsonRelationships(
            store,
            json['relations'] ?? {},
          );
        }
        // Ensure isSynced is set to true to avoid sync issues
        entity.isSynced = true;
        return box.put(entity);
      }
      return 0;
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
      "data": {
        ...toJson(),
        ...{"relations": toRelationJson()},
      },
    });
    return map;
  }
}

extension UserModelRelationJson on UserModel {
  Map<String, dynamic> toRelationJson() => {
    'posts': posts.map((ele) {
      final operation = ele.deletedAt != null
          ? EntityState.deleted
          : ele.createdAt.syncState(ele.updatedAt);
      return {
        "entity": "PostModel",
        "uuid": ele.uuid,
        "is_synced": ele.isSynced,
        "parent_uuid": this.uuid,
        "state": operation.name,
      };
    }).toList(),
  };

  UserModel applyJsonRelationships(Store store, Map<String, dynamic> json) {
    // Apply relations from JSON
    if (json.containsKey('posts')) {
      posts.clear();
      final postsBox = store.box<PostModel>();
      final query = postsBox
          .query(
            PostModel_.uuid.oneOf([
              ...(json['posts'] as List).map((data) => data['uuid'] as String),
            ]),
          )
          .build();

      final postsModels = query.find();
      posts.addAll(postsModels);

      query.close();
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
      "data": {
        ...toJson(),
        ...{"relations": toRelationJson()},
      },
    });
    return map;
  }
}

extension PostModelRelationJson on PostModel {
  Map<String, dynamic> toRelationJson() => {
    'user': user.target != null
        ? {
            "entity": "UserModel",
            "uuid": user.target?.uuid,
            "is_synced": user.target!.isSynced,
            "parent_uuid": this.uuid,
            "state":
                (user.target!.deletedAt != null
                        ? EntityState.deleted
                        : user.target!.createdAt.syncState(
                            user.target!.updatedAt,
                          ))
                    .name,
          }
        : null,

    'comment': comment.target != null
        ? {
            "entity": "CommentModel",
            "uuid": comment.target?.uuid,
            "is_synced": comment.target!.isSynced,
            "parent_uuid": this.uuid,
            "state":
                (comment.target!.deletedAt != null
                        ? EntityState.deleted
                        : comment.target!.createdAt.syncState(
                            comment.target!.updatedAt,
                          ))
                    .name,
          }
        : null,
  };

  PostModel applyJsonRelationships(Store store, Map<String, dynamic> json) {
    // Apply relations from JSON
    if (json.containsKey('user') && json['user'] != null) {
      final userBox = store.box<UserModel>();
      final query = userBox
          .query(UserModel_.uuid.equals(json['user']['uuid']))
          .build();
      final data = query.findFirst();
      if (data != null) {
        user.targetId = data.id;
      }
      query.close();
    }

    if (json.containsKey('comment') && json['comment'] != null) {
      final commentBox = store.box<CommentModel>();
      final query = commentBox
          .query(CommentModel_.uuid.equals(json['comment']['uuid']))
          .build();
      final data = query.findFirst();
      if (data != null) {
        comment.targetId = data.id;
      }
      query.close();
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
      "data": {
        ...toJson(),
        ...{"relations": toRelationJson()},
      },
    });
    return map;
  }
}

extension CommentModelRelationJson on CommentModel {
  Map<String, dynamic> toRelationJson() => {
    'user': user.target != null
        ? {
            "entity": "UserModel",
            "uuid": user.target?.uuid,
            "is_synced": user.target!.isSynced,
            "parent_uuid": this.uuid,
            "state":
                (user.target!.deletedAt != null
                        ? EntityState.deleted
                        : user.target!.createdAt.syncState(
                            user.target!.updatedAt,
                          ))
                    .name,
          }
        : null,
  };

  CommentModel applyJsonRelationships(Store store, Map<String, dynamic> json) {
    // Apply relations from JSON
    if (json.containsKey('user') && json['user'] != null) {
      final userBox = store.box<UserModel>();
      final query = userBox
          .query(UserModel_.uuid.equals(json['user']['uuid']))
          .build();
      final data = query.findFirst();
      if (data != null) {
        user.targetId = data.id;
      }
      query.close();
    }

    return this;
  }

  Map<String, dynamic> toSyncJson() {
    final operation = deletedAt != null
        ? EntityState.deleted
        : createdAt.syncState(updatedAt);
    final Map<String, dynamic> map = {};
    map.addAll({"entity": "CommentModel"});
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
