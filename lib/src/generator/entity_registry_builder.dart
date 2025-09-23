import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart' as df;
import 'package:glob/glob.dart';
import 'package:objectbox/objectbox.dart';
import 'package:source_gen/source_gen.dart';

class EntityRegistryBuilder implements Builder {
  final entityChecker = TypeChecker.fromRuntime(Entity);

  @override
  final buildExtensions = const {
    r'$lib$': ['generated/entity_registry.g.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    // ignore: deprecated_member_use
    final classes = <ClassElement>[];

    await for (final input in buildStep.findAssets(Glob('lib/**.dart'))) {
      final content = await buildStep.readAsString(input);

      // Skip part files
      if (content.contains(RegExp(r'\bpart of\b'))) {
        continue;
      }
      final libElement = await buildStep.resolver.libraryFor(input);

      final libReader = LibraryReader(libElement);
      for (final clazz in libReader.classes) {
        if (entityChecker.hasAnnotationOf(clazz)) {
          classes.add(clazz);
        }
      }
    }

    final buffer = StringBuffer();

    buffer.writeln('// dart format width=80');
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln(
      "\n//**************************************************************************",
    );
    buffer.writeln("// FlutterSyncGenerator");
    buffer.writeln(
      "//**************************************************************************\n",
    );
    buffer.writeln('// coverage:ignore-file');
    buffer.writeln('// ignore_for_file: type=lint, unused_local_variable');
    buffer.writeln(
      "\nimport 'package:flutter_offline_sync/flutter_offline_sync.dart';",
    );
    buffer.writeln(
      "import 'package:flutter_offline_sync/src/generator/entity_registry.dart';",
    );
    // buffer.writeln(
    //   "import 'package:flutter_offline_sync/src/utils/logger.dart';",
    // );
    buffer.writeln(generateExportObjectboxG(buildStep));

    for (final entity in classes) {
      final importUri = entity.source.uri.toString();
      buffer.writeln("import '$importUri';");
    }

    buffer.writeln('\nfinal Map<String, EntityHandler> _generatedRegistry = {');

    for (final clazz in classes) {
      final entity = clazz.name;
      buffer.writeln("  '$entity': EntityHandler(");
      buffer.writeln("    boxFactory: (store) => store.box<$entity>(),");
      buffer.writeln("    fetchFunction: (store, lastSync) {");
      buffer.writeln("      final box = store.box<$entity>();");
      buffer.writeln(
        "      final query = box.query(${entity}_.updatedAt.greaterThan(lastSync.millisecondsSinceEpoch).and(${entity}_.isSynced.equals(false)))",
      );
      buffer.writeln(
        "      .order(${entity}_.updatedAt, flags: Order.descending).build();",
      );
      buffer.writeln("      final updates = query.find();");
      buffer.writeln("      query.close();");
      buffer.writeln(
        "      return updates.map((ele)=>{...ele.toSyncJson(), ...toRelationMap(ele.toRelationJson())}).toList();",
      );
      buffer.writeln("    },");
      buffer.writeln("    fetchUpdatedIdsFunction: (store, lastSync) {");
      buffer.writeln("      final box = store.box<$entity>();");
      buffer.writeln(
        "      final query = box.query(${entity}_.updatedAt.greaterThan(lastSync.millisecondsSinceEpoch).and(${entity}_.isSynced.equals(false)))",
      );
      buffer.writeln(
        "      .order(${entity}_.updatedAt, flags: Order.descending).build();",
      );
      buffer.writeln("      final ids = query.findIds();");
      buffer.writeln("      query.close();");
      buffer.writeln("      return ids;",);
      buffer.writeln("    },");
      buffer.writeln("    makeEntitiesAsSyncronizedFunction: (store, lastSync) {");
      buffer.writeln("      final box = store.box<$entity>();");
      buffer.writeln(
        "      final query = box.query(${entity}_.updatedAt.greaterThan(lastSync.millisecondsSinceEpoch).and(${entity}_.isSynced.equals(false)))",
      );
      buffer.writeln(
        "      .order(${entity}_.updatedAt, flags: Order.descending).build();",
      );
      buffer.writeln("      final entities = query.find();");
      buffer.writeln('''     
           for(var entity in entities){
             entity.isSynced = true;
             box.put(entity);
           }
           query.close();
      return entities.length;
      ''');
      buffer.writeln("    },");
      buffer.writeln(
        "    deleteFunction: (store, id) => store.box<$entity>().remove(id),",
      );
      buffer.writeln("    updateFunction: (store, json) {");
      buffer.writeln("      $entity entity = $entity.fromJson(json);");
      buffer.writeln(
        "      if ((entity.uuid ?? '').isEmpty) throw Exception('Cannot update $entity without ID');",
      );
      buffer.writeln(
        "     /// explictly set [id] to zero to avoid local db primary key out of sequence error ",
      );
      buffer.writeln("     entity.id = 0;\n");

      buffer.writeln("     final box = store.box<$entity>();\n");

      buffer.writeln(
        "     final query = box.query(${entity}_.uuid.equals(entity.uuid!)).build();\n",
      );

      buffer.writeln("      final model = query.findFirst();\n");

      buffer.writeln("      if(model != null) { entity.id = model.id;}\n");

      buffer.writeln("      query.close();");

      buffer.writeln(
        "      entity = entity.applyJsonRelationships(store, json);",
      );
      buffer.writeln(
        " // Ensure isSynced is set to true to avoid sync issues\n",
      );
      buffer.writeln("   entity.isSynced = true;");
      buffer.writeln("      return box.put(entity);");
      buffer.writeln("    },");
      buffer.writeln("  ),");
    }

    buffer.writeln('};');

    buffer.writeln(
      '\nfinal class ObjectboxSyncRegistry extends EntityRegistry {',
    );
    buffer.writeln('  ObjectboxSyncRegistry(super.store);');
    buffer.writeln('\n  @override');
    buffer.writeln(
      '  EntityHandler? get(String name) => _generatedRegistry[name];',
    );
    buffer.writeln('\n  @override');
    buffer.writeln(
      '  List<String>  getAllEntities() => _generatedRegistry.keys.toList();',
    );
    buffer.writeln('}');

    buffer.writeln('\n// GENERATED TORELATIONJSON EXTENSIONS');

    for (final clazz in classes) {
      final className = clazz.name;

      // 2. Generate toRelationJson extension for the class
      buffer.writeln('extension ${className}RelationJson on $className {');

      buffer.writeln('  Map<String, dynamic> toRelationJson() => {');

      for (final field in clazz.fields) {
        final name = field.name;
        final typeStr = getStrFieldType(field);
        // skip id field to avoid db storage mismatch
        if (field.isStatic || name == 'id') continue;

        if (typeStr.startsWith('ToOne<')) {
          final relatedType = getFieldType(field);
          buffer.writeln('''
            '$name':$name.target != null ?
            $name.target!.isSynced ? 
           {
            "entity": "$relatedType", 
            "uuid": $name.target?.uuid,
            "is_synced": $name.target!.isSynced, 
           }:
             {"entity": "$relatedType",
            "state": ($name.target!.deletedAt != null ? EntityState.deleted : $name.target!.createdAt.syncState($name.target!.updatedAt)).name,
             ...$name.target!.toJson()
             }
             : null,
            ''');
        } else if (typeStr.startsWith('ToMany<')) {
          final relatedType = getFieldType(field);

          buffer.writeln(''' 
          '$name': $name.map((ele) {
          final operation = ele.deletedAt != null ? EntityState.deleted : ele.createdAt.syncState(ele.updatedAt);
          return ele.isSynced ? 
           {
            "entity": "$relatedType", 
            "uuid": ele.uuid,
            "is_synced": ele.isSynced, 
           }:
           {
             "entity": "$relatedType",
             "state": operation.name,
             ...ele.toJson()
          };
          }).toList(),
          ''');
        }
      }

      buffer.writeln('  };');
      buffer.writeln('\n');
      buffer.writeln(
        '  $className applyJsonRelationships(Store store, Map<String, dynamic> json) {',
      );
      buffer.writeln('    // Apply relations from JSON');

      for (final field in clazz.fields) {
        final name = field.name;
        final typeStr = getStrFieldType(field);
        if (field.isStatic) continue;
        if (typeStr.startsWith('ToOne<')) {
          final relatedType = getFieldType(field);
          buffer.writeln(
            "    if (json.containsKey('$name') && json['$name'] != null) {",
          );
          buffer.writeln("  final ${name}Box = store.box<$relatedType>();\n");
          buffer.writeln(
            "  final query = ${name}Box.query(${relatedType}_.uuid.equals(json['$name']['uuid'])).build();\n",
          );
          buffer.writeln("  final data = query.findFirst();\n");
          buffer.writeln("  if(json['$name']['is_synced']){");
          buffer.writeln("  if(data != null) { $name.targetId = data.id;}");
          buffer.writeln("  }");
          buffer.writeln("  else{");
          buffer.writeln(
            "  final ${name}Entity = $relatedType.fromJson(json['$name']);\n",
          );
          buffer.writeln("  if(data != null) { ${name}Entity.id = data.id;}");
          buffer.writeln("  else{ ${name}Box.put(${name}Entity);}");
          buffer.writeln("  query.close();");
          buffer.writeln("  $name.target = ${name}Entity;}");
          buffer.writeln(" }\n");
        } else if (typeStr.startsWith('ToMany<')) {
          buffer.writeln("    if (json.containsKey('$name')) {");
          buffer.writeln("      $name.clear();");
          final relatedType = getFieldType(field);
          buffer.writeln("      final ${name}Box = store.box<$relatedType>();");
          buffer.writeln("      for (final data in json['$name']) {");
          buffer.writeln(
            "  final query = ${name}Box.query(${relatedType}_.uuid.equals(data['uuid'])).build();\n",
          );
          buffer.writeln("  final ${name}Model = query.findFirst();\n");
          buffer.writeln("  if(data['is_synced']){");
          buffer.writeln("  if(${name}Model != null) { ");
          buffer.writeln("  ${name}Box.put(${name}Model);  ");
          buffer.writeln("  $name.add(${name}Model);  }");
          buffer.writeln("  }");
          buffer.writeln("  else{");
          buffer.writeln(
            "  final ${name}Entity = $relatedType.fromJson(data);\n",
          );
          buffer.writeln("  if(${name}Model != null) { ${name}Entity.id = ${name}Model.id;}");
          buffer.writeln("  else{ ${name}Box.put(${name}Entity);}");
          buffer.writeln("  $name.add(${name}Entity);  \n}");
          buffer.writeln("  query.close();");
          buffer.writeln("  }");
          buffer.writeln(" }\n");
        }
      }
      buffer.writeln('  return this;');
      buffer.writeln('  }');
      buffer.writeln('\n');
      buffer.writeln('  Map<String, dynamic> toSyncJson(){');
      buffer.writeln(
        '    final operation = deletedAt != null ? EntityState.deleted : createdAt.syncState(updatedAt);',
      );
      buffer.writeln('    final Map<String, dynamic> map = {};');
      buffer.writeln('    map.addAll({"entity": "$className"});');
      buffer.writeln('    map.addAll({"entityId": this.uuid});');
      buffer.writeln('    map.addAll({"state": "\${operation.name}"});');
      buffer.writeln(
        '    map.addAll({"data": {...toJson(),...toRelationJson()}});',
      );
      buffer.writeln('    return map;');
      buffer.writeln('  }\n');
      // buffer.writeln('List<Map<String, dynamic>> toFilterMap() {');
      // buffer.writeln(' List<Map<String, dynamic>> relations = [];');
      // buffer.writeln('''   for (var data in toRelationJson().values) {
      //     if (data == null) continue;

      //     if (data is List) {
      //       relations.addAll(
      //         data.map(
      //           (ele) => {
      //             "entity": ele['entity'],
      //             "uuid": ele['uuid'],
      //             "is_synced": ele['is_synced'],
      //           },
      //         ),
      //       );
      //     } else {
      //       relations.add({
      //         "entity": data['entity'],
      //         "uuid": data['uuid'],
      //         "is_synced": data['is_synced'],
      //       });
      //     }
      //   }
      //   return relations;
      // }
      // ''');

      buffer.writeln('  }');
      buffer.writeln('\n');
    }

    buffer.writeln('// dart format on');

    final outputId = AssetId(
      buildStep.inputId.package,
      'lib/generated/entity_registry.g.dart',
    );
    final formatted = df.DartFormatter(
      languageVersion: df.DartFormatter.latestLanguageVersion,
    ).format(buffer.toString());
    await buildStep.writeAsString(outputId, formatted);
  }
}

String generateExportObjectboxG(BuildStep buildStep) {
  final package = buildStep.inputId.package;
  return "import 'package:$package/objectbox.g.dart';";
}

// ignore: deprecated_member_use
String getFieldType(FieldElement field) {
  return (field.type as ParameterizedType).typeArguments.first.getDisplayString(
    withNullability: false,
  );
}

// ignore: deprecated_member_use
String getStrFieldType(FieldElement field) {
  return field.type.getDisplayString(withNullability: false);
}
