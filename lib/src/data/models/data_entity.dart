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

  /// used to determine if this `Entity` was already saved in the relations array
  bool isSaved;

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
    this.isSaved = false,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> update = jsonDecode(data);
    update.addAll({"isSaved": isSaved});
    return {
      'uuid': uuid,
      'tableName': tableName,
      'entityId': entityId,
      'entity': entity,
      'data': update,
      'state': operation,
      'updateId': id,
      'isSynced': isSynced,
      'isSaved': isSaved,
      'created_at': update['created_at'],
      'deleted_at': update['deleted_at'],
      'updated_at': update['updated_at'],
    };
  }

  Map<String, dynamic> toDataJson() => {
    ...jsonDecode(data),
    "isSaved": isSaved,
  };

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      uuid: json['uuid'],
      data: jsonEncode(json['data']),
      tableName: json['entity'],
      operation: json['state'] ?? 'create',
      entity: json['entity'],
      isSaved: json['isSaved'] ?? false,
      entityId: json['entityId']?.toString(),

      /// TODO: handle naming cases i.e [createdAt, deletedAt, updatedAt]
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
