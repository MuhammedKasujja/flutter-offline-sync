// GENERATED CODE - DO NOT MODIFY BY HAND
// 
// generated from object_registry package
// 
import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:example/data/models/user_model.dart';

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
};

final class ObjectboxSyncRegistry extends EntityRegistry {
  ObjectboxSyncRegistry(super.store);

  @override
  EntityHandler? get(String name) => _generatedRegistry[name];

  @override
  List<String>  getAllEntities() => _generatedRegistry.keys.toList();
}
