import 'package:objectbox/objectbox.dart';

@Entity()
class ConfigurationEntity {
  @Id()
  int id;
  String? currentDeviceId;
  String? accountKey;

  ConfigurationEntity({this.id = 0, this.currentDeviceId, this.accountKey});

  factory ConfigurationEntity.fromJson(Map<String, dynamic> json) =>
      ConfigurationEntity(
        currentDeviceId: json['currentDeviceId'],
        accountKey: json['accountKey'],
      );
}
