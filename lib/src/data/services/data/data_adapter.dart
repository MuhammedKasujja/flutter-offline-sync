import 'dart:convert';

import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';

import 'data_adapter_interface.dart';

class DataAdapter extends IDataAdapter {
  final String tableName;
  final String modelName;

  DataAdapter({required this.modelName, required this.tableName}) {
    assert(tableName.isNotEmpty, 'Table name is required');
    assert(modelName.isNotEmpty, 'Model name is required');
  }

  @override
  Future<DataEntity?> queueCreate({required Map<String, dynamic> data}) async {
    return saveEntity(
      DataEntity(
        data: jsonEncode(data),
        tableName: tableName,
        operation: 'create',
        entity: modelName,
        entityId: data['id']?.toString(),
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
        entity: modelName,
        entityId: entityId,
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
        entity: modelName,
        entityId: entityId,
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
        entityId: data['id']?.toString() ?? entityId,
        operation: 'update',
        entity: modelName,
      ),
    );
  }
}
