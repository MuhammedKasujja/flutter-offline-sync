import 'dart:convert';

import 'package:objectbox/objectbox.dart';

///
@Entity()
class DataEntity {
  @Id()
  int id;
  String data;
  String tableName;

  /// Entity ID this change relates to.
  String? entityId;
  String operation;

  DataEntity({
    this.id = 0,
    required this.data,
    required this.tableName,
    this.entityId,
    required this.operation,
  });

  Map<String, dynamic> toJson() {
    return {
      'table': tableName,
      'entityId': entityId,
      'data': jsonDecode(data),
      'operation': operation,
    };
  }
}
