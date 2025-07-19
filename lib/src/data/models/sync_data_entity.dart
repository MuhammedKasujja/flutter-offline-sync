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

  factory SyncDataEntity.fromJson(Map<String, dynamic> json) =>
      SyncDataEntity(
        id: json["id"],
        deviceId: json["deviceId"],
        userId: json["userId"],
        accountKey: json["accountKey"],
        data: List<DataEntity>.from(json["data"].map((x) => DataEntity.fromJson(x))),
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
