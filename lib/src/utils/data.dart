import 'package:flutter_offline_sync/objectbox.g.dart';
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

List<Map<String, dynamic>> toRelationFilter(Map<String, dynamic> map) {
  List<Map<String, dynamic>> relations = [];
  for (var data in map.values) {
    if (data == null) continue;

    if (data is List) {
      relations.addAll(
        data.map(
          (ele) => {
            "entity": ele['entity'],
            "uuid": ele['uuid'],
            "is_synced": ele['is_synced'],
          },
        ),
      );
    } else {
      relations.add({
        "entity": data['entity'],
        "uuid": data['uuid'],
        "is_synced": data['is_synced'],
      });
    }
  }
  return relations;
}
