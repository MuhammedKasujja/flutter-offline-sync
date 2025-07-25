import 'package:objectbox/objectbox.dart';

typedef BoxFactory = Box Function(Store store);
typedef DeleteFunction = bool Function(Store store, int id);
typedef UpdateFunction = int Function(Store store, Map<String, dynamic> json);
typedef FetchFunction =
    List<Map<String, dynamic>> Function(Store store, DateTime lastSync);

class EntityHandler {
  final BoxFactory boxFactory;
  final DeleteFunction deleteFunction;
  final UpdateFunction updateFunction;
  final FetchFunction fetchFunction;

  const EntityHandler({
    required this.boxFactory,
    required this.deleteFunction,
    required this.updateFunction,
    required this.fetchFunction,
  });
}

abstract class EntityRegistry {
  final Store store;
  EntityRegistry(this.store);

  EntityHandler? get(String entityName);

  List<String> getAllEntities();

  Box<T> box<T>() => store.box<T>();

  int save(String entityName, Map<String, dynamic> json) =>
      get(entityName)?.updateFunction(store, json) ??
      (throw Exception("Handler not found for $entityName"));

  bool delete(String entityName, int id) =>
      get(entityName)?.deleteFunction(store, id) ??
      (throw Exception("Handler not found for $entityName"));

  List<Map<String, dynamic>> fetchEntityUpdates(String entityName, DateTime lastSync) =>
      get(entityName)?.fetchFunction(store, lastSync) ??
      (throw Exception("Handler not found for $entityName"));
}
