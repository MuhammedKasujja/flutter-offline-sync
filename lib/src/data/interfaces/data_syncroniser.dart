abstract class IDataSyncroniser {
  Future<void> syncLocalUpdates();
  Future<void> syncRemoteUpdates();
}
