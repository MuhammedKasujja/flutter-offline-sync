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
        final entityUpdates = entityRegistry.fetchEntityUpdates(entityName, lastSyncDate);
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
}
