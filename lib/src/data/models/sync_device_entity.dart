import 'package:objectbox/objectbox.dart';

@Entity()
class SyncDeviceEntity {
  @Id()
  int id;
  String deviceId;
  String userId;
  @Property(type: PropertyType.date)
  final DateTime? updatedAt;
  @Property(type: PropertyType.date)
  final DateTime? createdAt;

  SyncDeviceEntity({
    this.id = 0,
    required this.deviceId,
    required this.userId,
    this.updatedAt,
    this.createdAt,
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
