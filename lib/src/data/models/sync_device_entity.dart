import 'package:objectbox/objectbox.dart';

@Entity()
class SyncDeviceEntity {
  @Id()
  int id;
  @Unique()
  String? uuid;
  String deviceId;
  String userId;

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
  });

  factory SyncDeviceEntity.fromJson(Map<String, dynamic> json) {
    return SyncDeviceEntity(
      id: json['id'],
      uuid: json['uuid'],
      deviceId: json['deviceId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'uuid': uuid, 'deviceId': deviceId, 'userId': userId};
  }
}
