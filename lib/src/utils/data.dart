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
