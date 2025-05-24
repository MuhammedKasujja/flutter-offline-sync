import 'dart:convert';

import 'package:flutter_offline_sync/src/data/interfaces/data_adapter.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';

class DataAdapter extends IDataAdapter {
  late final String tableName;

  @override
  Future<DataEntity?> queueCreate({required Map<String, dynamic> data}) async {
    return saveEntity(
      DataEntity(
        data: jsonEncode(data),
        tableName: tableName,
        operation: 'create',
      ),
    );
  }

  @override
  Future<DataEntity?> queueDelete({required String entityId}) async {
    return saveEntity(
      DataEntity(
        data: jsonEncode({"entityId": entityId}),
        tableName: tableName,
        operation: 'delete',
      ),
    );
  }

  @override
  Future<DataEntity?> queueDeleteOnCreate({required String entityId}) async {
    return saveEntity(
      DataEntity(
        data: jsonEncode({"entityId": entityId}),
        tableName: tableName,
        operation: 'deleteCreate',
      ),
    );
  }

  @override
  Future<DataEntity?> queueUpdate({
    required String entityId,
    required Map<String, dynamic> data,
  }) async {
    return saveEntity(
      DataEntity(
        data: jsonEncode(data),
        tableName: tableName,
        entityId: entityId,
        operation: 'update',
      ),
    );
  }
}
