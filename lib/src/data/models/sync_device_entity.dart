import 'package:objectbox/objectbox.dart';

@Entity()
class SyncDeviceEntity {
  @Id()
  int id;
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
      deviceId: json['deviceId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'deviceId': deviceId, 'userId': userId};
  }
}
