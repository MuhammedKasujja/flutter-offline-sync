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
      buffer.writeln(
        "      return updates.map((ele)=>ele.toSyncJson()).toList();",
      );
      buffer.writeln("    },");
      buffer.writeln(
        "    deleteFunction: (store, id) => store.box<$entity>().remove(id),",
      );
      buffer.writeln("    updateFunction: (store, json) {");
      buffer.writeln("      $entity entity = $entity.fromJson(json);");
      buffer.writeln(
        "      if ((entity.uuid ?? '').isEmpty) throw Exception('Cannot update $entity without ID');",
      );
      buffer.writeln("      entity = entity.applyJsonRelationships(store, json);");
      buffer.writeln(
        "      entity.isSynced = true;",
      ); // Ensure isSynced is set to true to avoid sync issues
      buffer.writeln("      return store.box<$entity>().put(entity);");
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

        if (field.isStatic || name == 'id') continue;

        if (typeStr.startsWith('ToOne<')) {
          buffer.writeln("  '$name':$name.target?.toJson(),");
        } else if (typeStr.startsWith('ToMany<')) {
          buffer.writeln(" '$name': $name.map((e) => e.toJson()).toList(),");
        }
      }

      buffer.writeln('  };');
      buffer.writeln('\n');
      buffer.writeln('  $className applyJsonRelationships(Store store, Map<String, dynamic> json) {');
      buffer.writeln('    // Apply relations from JSON');

      for (final field in clazz.fields) {
        final name = field.name;
        final typeStr = getStrFieldType(field);
        if (field.isStatic) continue;
        if (typeStr.startsWith('ToOne<')) {
          final relatedType = getFieldType(field);
          buffer.writeln(
            "    if (json.containsKey('$name') && json['$name'] != null) $name.target = $relatedType.fromJson(json['$name']);",
          );
        } else if (typeStr.startsWith('ToMany<')) {
          buffer.writeln("    if (json.containsKey('$name')) {");
          buffer.writeln("      $name.clear();");
          final relatedType = getFieldType(field);
          buffer.writeln("      final ${name}Box = store.box<$relatedType>();");
          buffer.writeln("      for (final data in json['$name']) {");
          buffer.writeln("        final item = $relatedType.fromJson(data);");
          buffer.writeln("        $name.add(item);");
          buffer.writeln("      }");
          buffer.writeln("    }");
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
      buffer.writeln('  }');
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
