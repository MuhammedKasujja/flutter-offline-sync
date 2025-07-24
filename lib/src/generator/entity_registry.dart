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

  EntityHandler? get(String name);

  List<String> getAllEntities();

  Box<T> box<T>() => store.box<T>();

  int save(String name, Map<String, dynamic> json) =>
      get(name)?.updateFunction(store, json) ??
      (throw Exception("Handler not found for $name"));

  bool delete(String name, int id) =>
      get(name)?.deleteFunction(store, id) ??
      (throw Exception("Handler not found for $name"));

  List<Map<String, dynamic>> fetchAllUpdates(String name, DateTime lastSync) =>
      get(name)?.fetchFunction(store, lastSync) ??
      (throw Exception("Handler not found for $name"));
}
