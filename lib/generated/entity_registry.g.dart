// GENERATED CODE - DO NOT MODIFY BY HAND
// 
// generated from object_registry package
// 
import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';

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
};

final class ObjectboxSyncRegistry extends EntityRegistry {
  ObjectboxSyncRegistry(super.store);

  @override
  EntityHandler? get(String name) => _generatedRegistry[name];

  @override
  List<String>  getAllEntities() => _generatedRegistry.keys.toList();
}
