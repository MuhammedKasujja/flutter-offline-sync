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
    final data = jsonEncode(json['data']);
    return DataEntity(
      uuid: json['uuid'],
      data: data,
      tableName: json['entity'],
      operation: json['state'] ?? 'create',
      entity: json['entity'],
      entityId: json['entityId']?.toString(),
      createdAt:
          json['data']['created_at'] != null
              ? DateTime.parse(json['data']['created_at'])
              : null,
      deletedAt:
          json['data']['deleted_at'] != null
              ? DateTime.parse(json['data']['deleted_at'])
              : null,
      updatedAt:
          json['data']['updated_at'] != null
              ? DateTime.parse(json['data']['updated_at'])
              : null,
    );
  }
}
