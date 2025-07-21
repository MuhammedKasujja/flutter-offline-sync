import 'dart:convert';

import 'package:objectbox/objectbox.dart';

///
@Entity()
class DataEntity {
  @Id()
  int id;
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
      'tableName': tableName,
      'entityId': entityId,
      'entity': entity,
      'data': jsonDecode(data),
      'operation': operation,
      'updateId': id,
      'isSynced': isSynced,
    };
  }

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      data: jsonEncode(json['data']),
      tableName: json['tableName'],
      operation: json['operation'],
      entity: json['entity'],
      entityId: json['entityId'],
    );
  }
}
