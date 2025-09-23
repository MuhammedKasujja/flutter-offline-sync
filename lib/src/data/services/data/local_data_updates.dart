import 'package:flutter_offline_sync/src/generator/entity_registry.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

class LocalDataUpdates {
  final EntityRegistry entityRegistry;
  LocalDataUpdates(this.entityRegistry);

  Future<int> save(String entityName, Map<String, dynamic> json) async {
    try {
      return entityRegistry.save(entityName, json);
    } catch (e) {
      throw Exception("Failed to save $entityName: $e");
    }
  }

  Future<bool> delete(String entityName, int id) async {
    try {
      return entityRegistry.delete(entityName, id);
    } catch (e) {
      throw Exception("Failed to delete $entityName with ID $id: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchLocalUpdates(
    DateTime lastSyncDate,
  ) async {
    try {
      final entities = entityRegistry.getAllEntities();
      final localUpdates = <Map<String, dynamic>>[];
      for (final entityName in entities) {
        final entityUpdates = entityRegistry.fetchEntityUpdates(
          entityName,
          lastSyncDate,
        );
        if (entityUpdates.isNotEmpty) {
          localUpdates.addAll(entityUpdates);
        }
      }
      // final List<Map<String, dynamic>> sortedUpdates =
      //     localUpdates.toList()..sort(
      //       (a, b) => DateTime.parse(
      //         b['data']['updated_at'],
      //       ).compareTo(
      //         DateTime.parse(a['data']['updated_at']),
      //       ),
      //     );

      return localUpdates;
    } catch (e) {
      logger.error('Error fetching local updates', e);
      return [];
    }
  }

  Future<List<int>> getUpdatedEntityIds(DateTime lastSyncDate) async {
    try {
      final entities = entityRegistry.getAllEntities();
      final List<int> localUpdates = [];
      for (final entityName in entities) {
        final entityUpdates = entityRegistry.fetchUpdatedIds(
          entityName,
          lastSyncDate,
        );
        if (entityUpdates.isNotEmpty) {
          localUpdates.addAll(entityUpdates);
        }
      }
      return localUpdates;
    } catch (e) {
      logger.error('Error fetching local updates', e);
      return [];
    }
  }

  /// Mark all local updates as synced after uploading to remote server
  Future<int> markEntitiesAsSynced(DateTime lastSyncDate) async {
    try {
      final entities = entityRegistry.getAllEntities();
      int localUpdates = 0;
      for (final entityName in entities) {
        final count = entityRegistry.markAsSynced(entityName, lastSyncDate);
        localUpdates += count;
      }
      return localUpdates;
    } catch (e) {
      logger.error('Error updating sync status for local updates', e);
      return 0;
    }
  }
}
