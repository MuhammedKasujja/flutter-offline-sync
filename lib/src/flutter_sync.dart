import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/data/object_box.dart';

import 'data/services/configuration_service.dart';

class FlutterSync {
  static final FlutterSync _singleton = FlutterSync._init();

  late EntityRegistry _entityRegistry;

  late Map<String, dynamic> _requestExtras = {};

  Map<String, dynamic> get requestExtras => _requestExtras;

  static bool _initialized = false;

  FlutterSync._init();

  EntityRegistry get entityRegistry => _entityRegistry;

  static Future<void> init({required EntityRegistry registry}) async {
    if (!_initialized) {
      await ObjectBox.create();
      _singleton._entityRegistry = registry;
      _initialized = true;
    }
  }

  static Future<void> restart() async {
    _initialized = true;
  }

  static Future<void> setAuthToken(String? authToken) async {
    ConfigService.saveAuthToken(authToken);
    restart();
  }

  /// More data to go along with data upload request
  static Future<void> setRequestExtras(Map<String, dynamic> extras) async {
    _singleton._requestExtras = extras;
    restart();
  }

  static FlutterSync get instance {
    if (!_initialized) {
      throw Exception(
        'FlutterSync has not been initialized. Call init() first',
      );
    }
    return _singleton;
  }

  static FlutterSync get I => instance;
}
