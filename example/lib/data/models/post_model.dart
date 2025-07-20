import 'package:example/data/models/user_model.dart';
import 'package:example/database.dart';
import 'package:example/generated/entity_registry.g.dart';
import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'post_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class PostModel extends DataAdapter {
  @Id(assignable: true)
  int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final user = ToOne<UserModel>();

  PostModel({
    this.id = 0,
    required this.title,
    required this.content,
    required this.createdAt,
  }) : super(modelName: 'PostModel', tableName: 'PostModel');

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  PostModel? save() {
    final saved = saveEntity(this);
    if (saved != null) {
      super.queueCreate(data: saved.toSyncJson());
    }
    return saved;
  }
}
