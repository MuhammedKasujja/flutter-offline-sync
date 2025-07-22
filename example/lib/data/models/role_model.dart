import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'role_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class RoleModel {
  @Id()
  int id;
  final String name;
  final String? description;
  @Property(type: PropertyType.date)
  DateTime? updatedAt;
  @Property(type: PropertyType.date)
  DateTime createdAt;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;

  RoleModel({
    this.id = 0,
    required this.name,
    this.description,
    this.updatedAt,
    this.deletedAt,
    required this.createdAt,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
