abstract class ISyncRepository {
  Future<List<Map<String, dynamic>>> getPendingLocalUpdates();
  Future<void> clearUpdatesTable();
}