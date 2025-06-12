import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
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

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln(
      "\n // **************************************************************************",
    );
    buffer.writeln("// FlutterSyncGenerator");
    buffer.writeln(
      "\n// **************************************************************************",
    );
    buffer.writeln(
      "import 'package:flutter_offline_sync/flutter_offline_sync.dart';",
    );

    for (final entity in classes) {
      final importUri = entity.source.uri.toString();
      buffer.writeln("import '$importUri';");
    }

    buffer.writeln('\nfinal Map<String, EntityHandler> _generatedRegistry = {');

    for (final clazz in classes) {
      final entity = clazz.name;
      buffer.writeln("  '$entity': EntityHandler(");
      buffer.writeln("    boxFactory: (store) => store.box<$entity>(),");
      buffer.writeln(
        "    putFunction: (store, json) => store.box<$entity>().put($entity.fromJson(json)),",
      );
      buffer.writeln(
        "    deleteFunction: (store, id) => store.box<$entity>().remove(id),",
      );
      buffer.writeln("    updateFunction: (store, json) {");
      buffer.writeln("      final e = $entity.fromJson(json);");
      buffer.writeln(
        "      if (e.id == 0) throw Exception('Cannot update $entity without ID');",
      );
      buffer.writeln("      return store.box<$entity>().put(e);");
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

    final outputId = AssetId(
      buildStep.inputId.package,
      'lib/generated/entity_registry.g.dart',
    );
    await buildStep.writeAsString(outputId, buffer.toString());
  }
}
