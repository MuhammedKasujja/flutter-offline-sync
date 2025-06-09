import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/data/object_box.dart';

class FlutterSync {
  static final FlutterSync _singleton = FlutterSync._init();

  late DataSyncroniser _syncroniser;

  late EntityRegistry _entityRegistry;

  late Map<String, dynamic> _requestExtras = {};

  Map<String, dynamic> get requestExtras => _requestExtras;

  late SyncRequest _request;

  static bool _initialized = false;

  FlutterSync._init();

  DataSyncroniser get syncroniser => _syncroniser;

  EntityRegistry get entityRegistry => _entityRegistry;

  static Future<void> init({
    required SyncRequest setup,
    required EntityRegistry registry,
  }) async {
    _singleton._request = setup;
    if (!_initialized) {
      await ObjectBox.create();
      final syncroniser = DataSyncroniser(
        request: SyncRequest(
          baseUrl: setup.baseUrl,
          syncRemoteEndpoint: setup.syncRemoteEndpoint,
          syncLocalEndpoint: setup.syncLocalEndpoint,
          authToken: setup.authToken,
        ),
      );
      _singleton._entityRegistry = registry;
      _singleton._syncroniser = syncroniser;
      _initialized = true;
    }
  }

  static Future<void> restart() async {
    final syncroniser = DataSyncroniser(
      request: SyncRequest(
        baseUrl: _singleton._request.baseUrl,
        syncRemoteEndpoint: _singleton._request.syncRemoteEndpoint,
        syncLocalEndpoint: _singleton._request.syncLocalEndpoint,
        authToken: _singleton._request.authToken,
      ),
    );
    _singleton._syncroniser = syncroniser;
    _initialized = true;
  }

  static Future<void> setAuthToken(String authToken) async {
    _singleton._request.authToken = authToken;
    restart();
  }

  /// More data to go along with data upload request
  static Future<void> setRequestExtras(Map<String, dynamic> extras) async {
    _singleton._requestExtras = extras;
    _singleton._syncroniser.addRequestExtras(extras);
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
