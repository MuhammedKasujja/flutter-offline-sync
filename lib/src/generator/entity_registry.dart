import 'dart:math';

import 'package:objectbox/objectbox.dart';

typedef BoxFactory = Box Function(Store store);
typedef DeleteFunction = bool Function(Store store, int id);
typedef UpdateFunction = int Function(Store store, Map<String, dynamic> json);
typedef FetchFunction =
    List<Map<String, dynamic>> Function(Store store, DateTime lastSyncDate);
typedef FetchEntityIdsFunction =
    List<int> Function(Store store, DateTime lastSyncDate);

class EntityHandler {
  final BoxFactory boxFactory;
  final DeleteFunction deleteFunction;
  final UpdateFunction updateFunction;
  final FetchFunction fetchFunction;
  final FetchEntityIdsFunction fetchUpdatedIdsFunction;

  const EntityHandler({
    required this.boxFactory,
    required this.deleteFunction,
    required this.updateFunction,
    required this.fetchFunction,
    required this.fetchUpdatedIdsFunction,
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

  List<Map<String, dynamic>> fetchEntityUpdates(
    String entityName,
    DateTime lastSyncDate,
  ) =>
      get(entityName)?.fetchFunction(store, lastSyncDate) ??
      (throw Exception("Handler not found for $entityName"));
  List<int> fetchUpdatedIds(String entityName, DateTime lastSyncDate) =>
      get(entityName)?.fetchUpdatedIdsFunction(store, lastSyncDate) ??
      (throw Exception("Handler not found for $entityName"));
}

String generateUUID([int length = 32]) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(Random().nextInt(chars.length)),
    ),
  );
}

Map<String, dynamic> toRelationMap(Map<String, dynamic> map) {
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
  return {"relations": relations};
}
