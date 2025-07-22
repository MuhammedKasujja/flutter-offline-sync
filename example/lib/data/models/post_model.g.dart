// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  isSynced: json['is_synced'] as bool? ?? false,
  title: json['title'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  deletedAt:
      json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'is_synced': instance.isSynced,
};
