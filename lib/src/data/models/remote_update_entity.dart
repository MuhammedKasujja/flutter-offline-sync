// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';
import 'package:flutter_offline_sync/src/generator/entity_registry.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';

@Entity()
class RemoteUpdateEntity {
  @Id()
  int id;
  @Unique()
  String? uuid;
  bool isSynced;
  String data;
  @Property(type: PropertyType.date)
  DateTime? updatedAt;
  @Property(type: PropertyType.date)
  DateTime? createdAt;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;

  RemoteUpdateEntity({
    this.id = 0,
    this.uuid,
    required this.data,
    this.isSynced = false,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory RemoteUpdateEntity.fromJson(Map<String, dynamic> json) {
    return RemoteUpdateEntity(
      id: json['id'],
      uuid: json['uuid'],
      data: jsonEncode(json['data']),
      isSynced: json['is_synced'],
      createdAt:
          json['created_at'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['created_at'])
              : null,
      deletedAt:
          json['deleted_at'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['deleted_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['updated_at'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'data': jsonDecode(data),
      'is_synced': isSynced,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'deleted_at': deletedAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  RemoteUpdateEntity? save() {
    uuid ??= generateUUID(24);
    createdAt ??= DateTime.now();
    updatedAt = DateTime.now();

    return saveEntity(this);
  }

  bool forceDelete() {
    return getBox<RemoteUpdateEntity>().remove(id);
  }
}

class RemoteUpdateModel {
  int id;
  String uuid;
  SyncDataEntity data;

  RemoteUpdateModel({required this.id, required this.uuid, required this.data});

  factory RemoteUpdateModel.fromJson(Map<String, dynamic> json) {
    return RemoteUpdateModel(
      id: json['id'],
      uuid: json['uuid'],
      data: SyncDataEntity.fromJson(jsonDecode(json['data'])),
    );
  }
}
