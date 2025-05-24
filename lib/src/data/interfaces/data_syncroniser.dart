import 'package:objectbox/objectbox.dart';

abstract class IDataSyncroniser {
  Future<void> syncLocalUpdates({SyncChange cc});
  Future<void> syncRemoteUpdates();
}
