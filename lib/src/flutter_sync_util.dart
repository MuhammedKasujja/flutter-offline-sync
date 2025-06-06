import 'package:flutter/widgets.dart';
import 'package:flutter_offline_sync/src/sync_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlutterSyncUtil extends ConsumerWidget {
  const FlutterSyncUtil({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(networkStatusProvider);
    // return state.when(
    //   data: (data) {
    //     logger.info({'Internet status changed': data});
    //     return child;
    //   },
    //   error: (err, sts) => child,
    //   loading: () => child,
    // );
    ref.watch(syncManagerProvider);
    return child;
  }
}

class FlutterSyncProvider extends StatelessWidget {
  const FlutterSyncProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: FlutterSyncUtil(child: child));
  }
}
