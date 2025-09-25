import 'package:flutter_offline_sync/objectbox.g.dart';
import 'package:flutter_offline_sync/src/data/models/models.dart';
import 'package:flutter_offline_sync/src/data/object_box.dart';

T? saveEntity<T>(T entity) {
  final box = ObjectBox.instance.store.box<T>();
  int entityId = box.put(entity);

  return box.get(entityId);
}

Box<T> getBox<T>() {
  return ObjectBox.instance.store.box<T>();
}

bool deleteEntity<T>(int id) {
  final box = getBox<T>();
  if (id == 0) return false;
  return box.remove(id);
}

ConfigurationEntity? getConfig() {
  return getBox<ConfigurationEntity>().get(1);
}

List<Map<String, dynamic>> toRelationMap(Map<String, dynamic> map) {
  List<Map<String, dynamic>> relations = [];

  final Set<String> entityIds = {};

  for (var data in map.values.where((ele) => ele != null)) {
    if (data is List) {
      for (var ele in data) {
        if (entityIds.add(ele['uuid'])) {
          relations.add(_relationMap(ele));
        }
      }
    } else {
      if (entityIds.add(data['uuid'])) {
        relations.add(_relationMap(data));
      }
    }
  }
  return relations;
}

Map<String, dynamic> _relationMap(Map<String, dynamic> data) {
  return {
    "entity": data['entity'],
    "uuid": data['uuid'],
    "is_synced": data['is_synced'],
    "parent_uuid": data['parent_uuid'],
  };
}

List<EntityRelation> toEntityRelations(Map<String, dynamic> map) {
  List<EntityRelation> relations = [];
  for (var data in map.values) {
    if (data == null) continue;

    if (data is List<Map<String, dynamic>>) {
      relations.addAll(data.map((EntityRelation.fromJson)));
    } else {
      relations.add(EntityRelation.fromJson(data));
    }
  }
  return relations;
}
