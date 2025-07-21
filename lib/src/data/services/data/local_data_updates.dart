import 'package:flutter_offline_sync/flutter_offline_sync.dart';

class LocalDataUpdates {
  final EntityRegistry entityRegistry;
  LocalDataUpdates(this.entityRegistry);

  Future<int> save(String name, Map<String, dynamic> json) async {
    try {
      return entityRegistry.save(name, json);
    } catch (e) {
      throw Exception("Failed to save $name: $e");
    }
  }

  Future<bool> delete(String name, int id) async {
    try {
      return entityRegistry.delete(name, id);
    } catch (e) {
      throw Exception("Failed to delete $name with ID $id: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchLocalUpdates(
    DateTime lastSyncDate,
  ) async {
    try {
      final tables = entityRegistry.getAllEntities();
      final localUpdates = <Map<String, dynamic>>[];
      for (final table in tables) {
        final updates = entityRegistry.fetchAllUpdates(table, lastSyncDate);
        if (updates.isNotEmpty) {
          localUpdates.addAll(updates);
        }
      }
      return localUpdates;
    } catch (e) {
      // throw Exception("Failed to get $name with ID $id: $e");
      return [];
    }
  }
}
