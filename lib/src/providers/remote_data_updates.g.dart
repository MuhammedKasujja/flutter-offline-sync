// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_updates.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteDataUpdatesHash() => r'08716e057e5d441de678b59f7798907bbaa630d5';

/// See also [RemoteDataUpdates].
@ProviderFor(RemoteDataUpdates)
final remoteDataUpdatesProvider = AutoDisposeAsyncNotifierProvider<
  RemoteDataUpdates,
  List<DataEntity>
>.internal(
  RemoteDataUpdates.new,
  name: r'remoteDataUpdatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remoteDataUpdatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RemoteDataUpdates = AutoDisposeAsyncNotifier<List<DataEntity>>;
String _$syncRemoteUpdatesHash() => r'35ef6ca4601258187c0da8e0ac40dfac4da4ef9c';

/// See also [SyncRemoteUpdates].
@ProviderFor(SyncRemoteUpdates)
final syncRemoteUpdatesProvider =
    AutoDisposeAsyncNotifierProvider<SyncRemoteUpdates, void>.internal(
      SyncRemoteUpdates.new,
      name: r'syncRemoteUpdatesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$syncRemoteUpdatesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SyncRemoteUpdates = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
