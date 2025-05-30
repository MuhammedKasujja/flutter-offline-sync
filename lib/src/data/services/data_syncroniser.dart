import 'package:flutter_offline_sync/src/data/interfaces/data_syncroniser.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';

class DataSyncroniser extends IDataSyncroniser {
  @override
  Future<void> syncLocalUpdates() async {
    final box = getBox<DataEntity>();

    final updates = await box.getAllAsync();
    final List<Map<String, dynamic>> map =
        updates.map((data) => data.toJson()).toList();
  }

  @override
  Future<void> syncRemoteUpdates() {
    // TODO: implement syncRemoteUpdates
    throw UnimplementedError();
  }
}
