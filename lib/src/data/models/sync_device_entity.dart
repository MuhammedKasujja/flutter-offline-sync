import 'package:objectbox/objectbox.dart';

@Entity()
class SyncDeviceEntity {
  @Id()
  int id;
  @Unique()
  String? uuid;
  String deviceId;
  String userId;
  String userName;
  bool isActive;
  @Property(type: PropertyType.date)
  DateTime? lastSyncDate;

  // @Transient()
  // final timestamps = Timestamps();

  @Property(type: PropertyType.date)
  final DateTime? updatedAt;
  @Property(type: PropertyType.date)
  final DateTime? createdAt;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;
  bool isSynced;

  SyncDeviceEntity({
    this.id = 0,
    this.uuid,
    this.isSynced = false,
    required this.deviceId,
    required this.userId,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
    this.isActive = true,
    required this.userName,
    this.lastSyncDate,
  });

  factory SyncDeviceEntity.fromJson(Map<String, dynamic> json) {
    return SyncDeviceEntity(
      id: json['id'],
      uuid: json['uuid'],
      deviceId: json['deviceId'],
      userId: json['userId'],
      userName: json['userName'],
      isActive: json['isActive'] ?? true,
      lastSyncDate:
          json['lastSyncDate'] != null
              ? DateTime.parse(json['lastSyncDate'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'deviceId': deviceId,
      'userId': userId,
      'userName': userName,
      'isActive': isActive,
      'lastSyncDate': lastSyncDate?.toIso8601String(),
    };
  }
}
