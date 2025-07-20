import 'package:flutter_offline_sync/src/data/models/data_entity.dart';

abstract class IDataAdapter {
  Future<DataEntity?> queueCreate({required Map<String, dynamic> data});
  Future<DataEntity?> queueUpdate({
    required String entityId,
    required Map<String, dynamic> data,
  });
  Future<DataEntity?> queueDelete({required String entityId});
  Future<DataEntity?> queueDeleteOnCreate({required String entityId});
}
