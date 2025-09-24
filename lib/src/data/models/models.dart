export 'data_entity.dart';
export 'configuration_entity.dart';

class EntityRelation {
  final String entity;
  final String uuid;
  final String parentUuid;
  final bool isSynced;

  EntityRelation({
    required this.entity,
    required this.uuid,
    required this.isSynced,
    required this.parentUuid,
  });

  factory EntityRelation.fromJson(Map<String, dynamic> json) {
    return EntityRelation(
      entity: json['entity'],
      uuid: json['uuid'],
      isSynced: json['is_synced'] ?? false,
      parentUuid: json['parent_uuid'] ?? '',
    );
  }
}
