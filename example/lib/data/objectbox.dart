import 'package:flutter_offline_sync/objectbox.g.dart';
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

  static Future<void> create({required String databaseName}) async {
    assert(databaseName.isEmpty, 'Database name must be provided');
    if (!_initialized) {
      final path = await ObjectBox._getDBPath(databaseName);
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

  static Future<String> _getDBPath(String databaseName) async {
    final docsDir = await getApplicationDocumentsDirectory();
    return p.join(docsDir.path, databaseName);
  }
}
