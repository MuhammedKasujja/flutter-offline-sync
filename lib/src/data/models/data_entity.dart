import 'dart:convert';

import 'package:objectbox/objectbox.dart';

///
@Entity()
class DataEntity {
  @Id()
  int id;
  @Unique()
  String? uuid;
  String data;
  String tableName;
  String entity;
  bool isSynced;

  /// Entity ID this change relates to.
  String? entityId;
  String operation;
  @Property(type: PropertyType.date)
  final DateTime? updatedAt;
  @Property(type: PropertyType.date)
  final DateTime? createdAt;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;

  DataEntity({
    this.id = 0,
    this.uuid,
    required this.data,
    required this.tableName,
    this.entityId,
    required this.operation,
    required this.entity,
    this.isSynced = false,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'tableName': tableName,
      'entityId': entityId,
      'entity': entity,
      'data': jsonDecode(data),
      'state': operation,
      'updateId': id,
      'isSynced': isSynced,
    };
  }

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      uuid: json['uuid'],
      data: jsonEncode(json['data']),
      tableName: json['entity'],
      operation: json['state'] ?? 'create',
      entity: json['entity'],
      entityId: json['entityId']?.toString(),
    );
  }
}
