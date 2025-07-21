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
    buffer.writeln('// ignore_for_file: type=lint, unused_local_variable');
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln(
      "\n//**************************************************************************",
    );
    buffer.writeln("// FlutterSyncGenerator");
    buffer.writeln(
      "//**************************************************************************",
    );
    buffer.writeln(
      "\nimport 'package:flutter_offline_sync/flutter_offline_sync.dart';",
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
        "      final query = box.query(${entity}_.updatedAt.greaterThan(lastSync.millisecondsSinceEpoch)).build();",
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
        "      if (entity.id == 0) throw Exception('Cannot update $entity without ID');",
      );
      buffer.writeln("      entity = entity.applyRelationJson(store);");
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
        final typeStr = field.type.getDisplayString(withNullability: false);

        if (field.isStatic || name == 'id') continue;

        if (typeStr.startsWith('ToOne<')) {
          buffer.writeln("    '${name}Id': $name.targetId,");
        } else if (typeStr.startsWith('ToMany<')) {
          buffer.writeln("    '${name}Ids': $name.map((e) => e.id).toList(),");
        }
      }

      buffer.writeln('  };');
      buffer.writeln('\n');
      buffer.writeln('  $className applyRelationJson(Store store) {');
      buffer.writeln('    // Apply relations from JSON');
      buffer.writeln('    final json = toRelationJson();');

      for (final field in clazz.fields) {
        final name = field.name;
        final typeStr = field.type.getDisplayString(withNullability: false);
        if (field.isStatic) continue;
        if (typeStr.startsWith('ToOne<')) {
          buffer.writeln(
            "    if (json.containsKey('${name}Id')) $name.targetId = json['${name}Id'];",
          );
        } else if (typeStr.startsWith('ToMany<')) {
          buffer.writeln("    if (json.containsKey('${name}Ids')) {");
          buffer.writeln("      $name.clear();");
          final relatedType = (field.type as ParameterizedType)
              .typeArguments
              .first
              .getDisplayString(withNullability: false);
          buffer.writeln("      final ${name}Box = store.box<$relatedType>();");
          buffer.writeln("      for (final id in json['${name}Ids']) {");
          buffer.writeln("        final item = ${name}Box.get(id);");
          buffer.writeln("        if (item != null) $name.add(item);");
          buffer.writeln("      }");
          buffer.writeln("    }");
        }
      }
      buffer.writeln('  return this;');
      buffer.writeln('  }');
      buffer.writeln('\n');
      buffer.writeln('  Map<String, dynamic> toSyncJson(){');
      buffer.writeln('    final operation = createdAt.syncState(updatedAt);');
      buffer.writeln('    final Map<String, dynamic> map = {};');
      buffer.writeln('    map.addAll({"entity": "$className"});');
      buffer.writeln('    map.addAll({"entityId": this.id});');
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
