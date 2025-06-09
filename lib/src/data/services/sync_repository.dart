import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';

import '../interfaces/sync_repository.dart';

class SyncRepository implements ISyncRepository {
  @override
  Future<List<Map<String, dynamic>>> getPendingLocalUpdates() async {
    final box = getBox<DataEntity>();
    final updates = await box.getAllAsync();
    final List<Map<String, dynamic>> pendingUpdates =
        updates.map((data) => data.toJson()).toList();

    return pendingUpdates;
  }

  @override
  Future<void> clearUpdatesTable() async {
    final box = getBox<DataEntity>();
    box.removeAll();
  }
  
  @override
  Future<void> saveRemoteChanges(List<DataEntity> remoteDatachanges) async{
    
  }
}
