import 'package:example/data/objectbox.dart';
import 'package:example/objectbox.g.dart';

T? saveEntity<T>(T entity) {
  final box = ObjectBox.instance.store.box<T>();
  int entityId = box.put(entity);

  return box.get(entityId);
}

Box<T> getBox<T>() {
  return ObjectBox.instance.store.box<T>();
}
