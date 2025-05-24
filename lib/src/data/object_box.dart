import 'dart:io';
import 'package:flutter_offline_sync/objectbox.g.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ObjectBox {
  late final Store _store;

  // ignore: unused_element
  ObjectBox._create(this._store);

  static final ObjectBox _singleton = ObjectBox._internal();

  static bool _initialized = false;

  ObjectBox._internal();

  Store get store => _store;

  static Future<void> create() async {
    if (!_initialized) {
      final path = await ObjectBox._getDBPath();
      final store = await openStore(directory: path);
      _singleton._store = store;
      _initialized = true;
    }
  }

  static ObjectBox get instance {
    if (!_initialized) {
      throw Exception(
        'ObjectBox has not been initialized. Call create() first',
      );
    }
    return _singleton;
  }

  static ObjectBox get I => instance;

  static Future<String> _getDBPath() async {
    final docsDir = await getApplicationDocumentsDirectory();
    return p.join(docsDir.path, "offline-sync-db");
  }

  static Future<void> deleteDb() async {
    final path = await ObjectBox._getDBPath();
    return Directory(path).delete().then(
      (FileSystemEntity value) =>
          logger.error("DB Deleted: ${value.existsSync()}"),
    );
  }
}
