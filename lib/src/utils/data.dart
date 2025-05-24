import 'package:flutter_offline_sync/src/data/object_box.dart';

T? saveEntity<T>(T entity) {
  final box = ObjectBox.instance.store.box<T>();
  int entityId = box.put(entity);

  return box.get(entityId);
}
