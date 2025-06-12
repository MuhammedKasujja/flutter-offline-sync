import 'package:objectbox/objectbox.dart';

@Entity()
class SyncDeviceEntity {
  @Id()
  int id;
  String deviceId;
  String userId;

  SyncDeviceEntity({this.id = 0, required this.deviceId, required this.userId});

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
