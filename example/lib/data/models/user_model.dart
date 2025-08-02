import 'package:example/data/models/post_model.dart';
import 'package:example/database.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class UserModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  @Id()
  int id;
  @Unique()
  String? uuid;
  final String name;
  final int age;
  final String email;
  final String? phone;
  @Property(type: PropertyType.date)
  DateTime? updatedAt;
  @Property(type: PropertyType.date)
  DateTime? createdAt;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;
  bool isSynced;
  final posts = ToMany<PostModel>();

  UserModel({
    this.id = 0,
    this.uuid,
    this.isSynced = false,
    required this.age,
    required this.email,
    required this.name,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel? save() {
    isSynced = false; // Mark as not synced
    updatedAt = DateTime.now();
    final saved = saveEntity(this);
    return saved;
  }
}
