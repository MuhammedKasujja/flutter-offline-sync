import 'package:example/data/models/post_model.dart';
import 'package:example/database.dart';
import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class UserModel extends DataAdapter {
  @Id(assignable: true)
  int id;
  final String name;
  final int age;
  final String email;
  final String? phone;
  final posts = ToMany<PostModel>();

  UserModel({
    this.id = 0,
    required this.age,
    required this.email,
    required this.name,
    this.phone,
  }) : super(modelName: 'UserModel', tableName: 'users');

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel? save() {
    final saved = saveEntity(this);
    if (saved != null) {
      super.queueCreate(data: saved.toJson());
    }
    return saved;
  }
}
