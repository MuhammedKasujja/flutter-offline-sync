// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/data/models/data_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
    id: const obx_int.IdUid(1, 8095617417935777367),
    name: 'DataEntity',
    lastPropertyId: const obx_int.IdUid(5, 1640554381242179226),
    flags: 0,
    properties: <obx_int.ModelProperty>[
      obx_int.ModelProperty(
        id: const obx_int.IdUid(1, 4814854763836305094),
        name: 'id',
        type: 6,
        flags: 1,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(2, 390838745052845430),
        name: 'data',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(3, 7333676248898096708),
        name: 'tableName',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(4, 1278620971552686769),
        name: 'entityId',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(5, 1640554381242179226),
        name: 'operation',
        type: 9,
        flags: 0,
      ),
    ],
    relations: <obx_int.ModelRelation>[],
    backlinks: <obx_int.ModelBacklink>[],
  ),
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore({
  String? directory,
  int? maxDBSizeInKB,
  int? maxDataSizeInKB,
  int? fileMode,
  int? maxReaders,
  bool queriesCaseSensitiveDefault = true,
  String? macosApplicationGroup,
}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(
    getObjectBoxModel(),
    directory: directory ?? (await defaultStoreDirectory()).path,
    maxDBSizeInKB: maxDBSizeInKB,
    maxDataSizeInKB: maxDataSizeInKB,
    fileMode: fileMode,
    maxReaders: maxReaders,
    queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
    macosApplicationGroup: macosApplicationGroup,
  );
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
    entities: _entities,
    lastEntityId: const obx_int.IdUid(1, 8095617417935777367),
    lastIndexId: const obx_int.IdUid(0, 0),
    lastRelationId: const obx_int.IdUid(0, 0),
    lastSequenceId: const obx_int.IdUid(0, 0),
    retiredEntityUids: const [],
    retiredIndexUids: const [],
    retiredPropertyUids: const [],
    retiredRelationUids: const [],
    modelVersion: 5,
    modelVersionParserMinimum: 5,
    version: 1,
  );

  final bindings = <Type, obx_int.EntityDefinition>{
    DataEntity: obx_int.EntityDefinition<DataEntity>(
      model: _entities[0],
      toOneRelations: (DataEntity object) => [],
      toManyRelations: (DataEntity object) => {},
      getId: (DataEntity object) => object.id,
      setId: (DataEntity object, int id) {
        object.id = id;
      },
      objectToFB: (DataEntity object, fb.Builder fbb) {
        final dataOffset = fbb.writeString(object.data);
        final tableNameOffset = fbb.writeString(object.tableName);
        final entityIdOffset = object.entityId == null
            ? null
            : fbb.writeString(object.entityId!);
        final operationOffset = fbb.writeString(object.operation);
        fbb.startTable(6);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, dataOffset);
        fbb.addOffset(2, tableNameOffset);
        fbb.addOffset(3, entityIdOffset);
        fbb.addOffset(4, operationOffset);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (obx.Store store, ByteData fbData) {
        final buffer = fb.BufferContext(fbData);
        final rootOffset = buffer.derefObject(0);
        final idParam = const fb.Int64Reader().vTableGet(
          buffer,
          rootOffset,
          4,
          0,
        );
        final dataParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 6, '');
        final tableNameParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 8, '');
        final entityIdParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGetNullable(buffer, rootOffset, 10);
        final operationParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 12, '');
        final object = DataEntity(
          id: idParam,
          data: dataParam,
          tableName: tableNameParam,
          entityId: entityIdParam,
          operation: operationParam,
        );

        return object;
      },
    ),
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [DataEntity] entity fields to define ObjectBox queries.
class DataEntity_ {
  /// See [DataEntity.id].
  static final id = obx.QueryIntegerProperty<DataEntity>(
    _entities[0].properties[0],
  );

  /// See [DataEntity.data].
  static final data = obx.QueryStringProperty<DataEntity>(
    _entities[0].properties[1],
  );

  /// See [DataEntity.tableName].
  static final tableName = obx.QueryStringProperty<DataEntity>(
    _entities[0].properties[2],
  );

  /// See [DataEntity.entityId].
  static final entityId = obx.QueryStringProperty<DataEntity>(
    _entities[0].properties[3],
  );

  /// See [DataEntity.operation].
  static final operation = obx.QueryStringProperty<DataEntity>(
    _entities[0].properties[4],
  );
}
