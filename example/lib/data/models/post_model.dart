import 'package:example/data/models/user_model.dart';
import 'package:example/data/utils.dart';
import 'package:example/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'post_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class PostModel {
  @JsonKey(includeFromJson: false)
  @Id()
  int id;
  @Unique()
  String? uuid;
  final String title;
  final String content;
  @Property(type: PropertyType.date)
  DateTime? updatedAt;
  @Property(type: PropertyType.date)
  DateTime createdAt;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;
  bool isSynced;
  final user = ToOne<UserModel>();

  PostModel({
    this.id = 0,
    this.uuid,
    this.isSynced = false,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  PostModel? save() {
    isSynced = false; // Mark as not synced
    updatedAt = DateTime.now();
    uuid = getRandomString(24);
    final saved = saveEntity(this);
    return saved;
  }
}
