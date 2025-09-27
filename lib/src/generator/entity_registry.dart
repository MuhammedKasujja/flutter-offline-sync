import 'dart:math';

import 'package:objectbox/objectbox.dart';

typedef BoxFactory = Box Function(Store store);
typedef DeleteFunction = bool Function(Store store, int id);
typedef UpdateFunction = int Function(Store store, Map<String, dynamic> json);
typedef FetchFunction =
    List<Map<String, dynamic>> Function(Store store, DateTime lastSyncDate);
typedef FetchEntityIdsFunction =
    List<int> Function(Store store, DateTime lastSyncDate);

typedef MarkEntitySyncedFunction =
    int Function(Store store, DateTime lastSyncDate);

class EntityHandler {
  final BoxFactory boxFactory;
  final DeleteFunction deleteFunction;
  final UpdateFunction updateFunction;
  final FetchFunction fetchFunction;
  final FetchEntityIdsFunction fetchUpdatedIdsFunction;
  final MarkEntitySyncedFunction makeEntitiesAsSyncronizedFunction;

  const EntityHandler({
    required this.boxFactory,
    required this.deleteFunction,
    required this.updateFunction,
    required this.fetchFunction,
    required this.fetchUpdatedIdsFunction,
    required this.makeEntitiesAsSyncronizedFunction,
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
  
  int markAsSynced(String entityName, DateTime lastSyncDate) =>
      get(entityName)?.makeEntitiesAsSyncronizedFunction(store, lastSyncDate) ??
      (throw Exception("Handler not found for $entityName"));
}

String generateUUID([int length = 24]) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(Random().nextInt(chars.length)),
    ),
  );
}

