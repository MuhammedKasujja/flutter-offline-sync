import 'package:objectbox/objectbox.dart';

@Entity()
class ConfigurationEntity {
  @Id()
  int id;
  String? currentDeviceId;

  ConfigurationEntity({this.id = 0, this.currentDeviceId});

  factory ConfigurationEntity.fromJson(Map<String, dynamic> json) =>
      ConfigurationEntity(currentDeviceId: json['currentDeviceId']);
}
