import 'package:flutter_offline_sync/src/data/object_box.dart';
import 'package:flutter_offline_sync/src/generator/entity_registry.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

import 'data/services/configuration_service.dart';

class FlutterSync {
  static final FlutterSync _singleton = FlutterSync._internal();

  late EntityRegistry _entityRegistry;

  late String? _initEntityChecker;

  late Map<String, dynamic> _requestExtras = {};

  Map<String, dynamic> get requestExtras => _requestExtras;

  static bool _initialized = false;

  FlutterSync._internal();

  EntityRegistry get entityRegistry => _entityRegistry;

  /// [initEntityChecker] param used to check id some data already exists in teh local database
  ///
  /// [syncBaseUrl] Base URL for sync API endpoints
  static Future<void> init({
    required EntityRegistry registry,
    required String? initEntityChecker,
    required String syncBaseUrl,
  }) async {
    if (!_initialized) {
      await ObjectBox.create();
      _singleton._entityRegistry = registry;
      _initialized = true;
      _singleton._initEntityChecker = initEntityChecker;
    }
    if (isValidUrl(syncBaseUrl) == false) {
      throw Exception(
        'FlutterSync must be initialized with a valid syncBaseUrl parameter',
      );
    }
    await ConfigService.initSettings(syncBaseUrl: syncBaseUrl);
  }

  static Future<void> restart() async {
    _initialized = true;
  }

  static Future<void> setAuthToken(String? authToken) async {
    ConfigService.saveAuthToken(authToken);
    restart();
  }

  ///  Use sync `createdAt` for sorting updates if this is the first time syncing data
  ///
  ///  OR when [_initEntityChecker] is null or empty
  static Future<bool> canSyncUsingCreatedAt() async {
    final syncChecker = _singleton._initEntityChecker;
    if ((syncChecker ?? '').isEmpty) return true;

    final date = DateTime(2000, 1, 01);
    final entityUpdates = _singleton._entityRegistry.fetchEntityUpdates(
      syncChecker!,
      date,
    );

    return entityUpdates.isEmpty;
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
