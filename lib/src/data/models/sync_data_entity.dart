import 'package:flutter_offline_sync/src/data/models/data_entity.dart';

class DataUploadMap {
  List<DataEntity> relations;
  List<DataEntity> models;
  DataUploadMap({required this.relations, required this.models});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'relations': relations.map((x) => x.toJson()).toList(),
      'entities': models.map((x) => x.toJson()).toList(),
    };
  }

  factory DataUploadMap.fromJson(Map<String, dynamic> map) {
    return DataUploadMap(
      relations:
          map['relations'] != null
              ? List<DataEntity>.from(
                (map['relations'] as List<dynamic>).map<DataEntity>(
                  (x) => DataEntity.fromJson(x as Map<String, dynamic>),
                ),
              )
              : [],
      models: List<DataEntity>.from(
        (map['entities'] as List<dynamic>).map<DataEntity>(
          (x) => DataEntity.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class SyncDataEntity {
  int id;
  String deviceId;
  String userId;
  String accountKey;
  DataUploadMap data;
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
    data: DataUploadMap.fromJson(json["data"]),
    updateId: json["updateId"].toString(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "deviceId": deviceId,
    "userId": userId,
    "accountKey": accountKey,
    "data": data.toJson(),
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

class Parser {
  static SyncDataEntityList parseRemoteUpdates(List<dynamic> json) {
    return SyncDataEntityList.fromJson(json);
  }

  static List<MapEntry<String, dynamic>> decodeRemoteEntitiesInIsolate(
    List<DataEntity> remoteUpdates,
  ) {
    return remoteUpdates.map((remoteData) {
      return MapEntry(remoteData.entity, remoteData.toDataJson());
    }).toList();
  }
}
