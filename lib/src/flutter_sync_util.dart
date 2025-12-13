import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
// import 'package:flutter_offline_sync/src/providers/sync_manager.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class FlutterSyncUtil extends ConsumerWidget {
//   const FlutterSyncUtil({super.key, required this.child});

//   final Widget child;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final state = ref.watch(networkStatusProvider);
//     // return state.when(
//     //   data: (data) {
//     //     logger.info({'Internet status changed': data});
//     //     return child;
//     //   },
//     //   error: (err, sts) => child,
//     //   loading: () => child,
//     // );

//     ref.watch(syncManagerProvider);
//     return child;
//   }
// }

class FlutterSyncProvider extends StatefulWidget {
  /// FlutterSyncProvider: A widget that initializes sync configuration and provides
  ///
  /// necessary capabilities for offline synchronization functionality.
  ///
  /// this must wrap the main application widget, usually the root `MaterialApp` or `CupertinoApp`.
  ///
  ///
  /// ```dart
  /// import 'package:example/data/objectbox.dart';
  /// import 'package:example/generated/entity_registry.g.dart';
  /// import 'package:example/ui/users_screen.dart';
  /// import 'package:flutter/material.dart';
  /// import 'package:flutter_offline_sync/flutter_offline_sync.dart';
  ///
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await ObjectBox.create(databaseName: 'users_db');
  ///
  ///   await FlutterSync.init(
  ///     syncBaseUrl: 'http://192.168.1.4:3000/api/',
  ///     registry: ObjectboxSyncRegistry(ObjectBox.instance.store),
  ///     initEntityChecker: null,
  ///   );
  ///   runApp(const MainApp());
  /// }
  ///
  /// class MainApp extends StatelessWidget {
  ///   const MainApp({super.key});
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return FlutterSyncProvider(
  ///       child: const MaterialApp(
  ///         debugShowCheckedModeBanner: false,
  ///         home: UsersScreen(),
  ///       ),
  ///     );
  ///   }
  /// }
  /// ```
  ///
  const FlutterSyncProvider({
    super.key,
    required this.child,
  });

  /// Main application widget to wrap with sync capabilities
  ///
  /// usually the root `MaterialApp` or `CupertinoApp`
  final Widget child;

  @override
  State<FlutterSyncProvider> createState() => _FlutterSyncProviderState();
}

class _FlutterSyncProviderState extends State<FlutterSyncProvider> {
  @override
  void initState() {
    _setup();
    super.initState();
  }

  Future _setup() async {
    await AppConfig.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    // return ProviderScope(child: FlutterSyncUtil(child: widget.child));
    // return ProviderScope(child: widget.child);
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceConfigurationBloc>(
          create: (context) => DeviceConfigurationBloc(),
        ),
        BlocProvider<InternetConnectionBloc>(
          create: (context) => InternetConnectionBloc(),
        ),
        BlocProvider<LocalUpdatesBloc>(create: (context) => LocalUpdatesBloc()),
        BlocProvider<RemoteUpdatesBloc>(
          create: (context) => RemoteUpdatesBloc(),
        ),
        BlocProvider<SyncUpdateBloc>(create: (context) => SyncUpdateBloc()),
        BlocProvider<SyncDeviceBloc>(create: (context) => SyncDeviceBloc()),
      ],
      child: widget.child,
    );
  }
}
