import 'package:flutter_offline_sync/src/data/models/data_entity.dart';

class SyncDataEntity {
  int id;
  String deviceId;
  String userId;
  String accountKey;
  List<DataEntity> data;
  String updateId;
  DateTime createdAt;
  DateTime updatedAt;

  SyncDataEntity({
    required this.id,
    required this.deviceId,
    required this.userId,
    required this.accountKey,
    required this.data,
    required this.updateId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SyncDataEntity.fromJson(Map<String, dynamic> json) => SyncDataEntity(
    id: json["id"],
    deviceId: json["deviceId"],
    userId: json["userId"],
    accountKey: json["accountKey"],
    data: List<DataEntity>.from(
      json["data"].map((x) => DataEntity.fromJson(x)),
    ),
    updateId: json["updateId"].toString(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "deviceId": deviceId,
    "userId": userId,
    "accountKey": accountKey,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "updateId": updateId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class SyncDataEntityList {
  List<SyncDataEntity> entities;

  SyncDataEntityList({required this.entities});

  factory SyncDataEntityList.fromJson(List<dynamic> json) => SyncDataEntityList(
    entities: List<SyncDataEntity>.from(
      json.map((x) => SyncDataEntity.fromJson(x)),
    ),
  );

  List<Map<String, dynamic>> toJson() =>
      entities.map((entity) => entity.toJson()).toList();
}

class LocalSyncDataResponse {
  final DateTime lastSyncDate;
  final String lastUpdateId;

  LocalSyncDataResponse({
    required this.lastSyncDate,
    required this.lastUpdateId,
  });

  factory LocalSyncDataResponse.fromJson(Map<String, dynamic> json) {
    return LocalSyncDataResponse(
      lastSyncDate: DateTime.parse(json['lastSyncDate']),
      lastUpdateId: json['lastUpdateId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'lastUpdateId': lastUpdateId, 'lastSyncDate': lastSyncDate};
  }
}
