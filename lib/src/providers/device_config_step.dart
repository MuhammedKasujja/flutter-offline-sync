// import 'package:flutter_offline_sync/src/data/enums/enums.dart';
// import 'package:flutter_offline_sync/src/providers/register_device.dart';
// import 'package:flutter_offline_sync/src/providers/remote_data_updates.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final deviceStepProvider = StateNotifierProvider<DeviceStepNotifier, DeviceConfigStep>((ref) {
//   return DeviceStepNotifier(ref);
// });

// class DeviceStepNotifier extends StateNotifier<DeviceConfigStep> {
//   final Ref ref;

//   DeviceStepNotifier(this.ref) : super(DeviceConfigStep.form) {
//     _listenToProviders();
//   }

//   void _listenToProviders() {
//     ref.listen(registerDeviceProvider, (prev, next) {
//       next.whenOrNull(
//         data: (_) {
//           ref.read(remoteDataUpdatesProvider.notifier).fetchUpdates();
//           state = DeviceConfigStep.fetchingRemoteChanges;
//         },
//         error: (e, _) => ref.context.toast.error('$e'),
//       );
//     });

//     ref.listen(remoteDataUpdatesProvider, (prev, next) {
//       next.whenOrNull(
//         data: (remoteUpdates) {
//           if (remoteUpdates.isNotEmpty) {
//             ref.read(syncRemoteUpdatesProvider.notifier).syncUpdates(remoteUpdates);
//             state = DeviceConfigStep.syncingRemoteChanges;
//           }
//         },
//         error: (e, _) => ref.context.toast.error('$e'),
//       );
//     });
//   }
// }

// // class DeviceConfiguration extends ConsumerWidget {
// //   const DeviceConfiguration({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final step = ref.watch(deviceStepProvider);

// //     switch (step) {
// //       case DeviceConfigStep.form:
// //         return const DeviceConfigurationForm();
// //       case DeviceConfigStep.fetchingRemoteChanges:
// //         return const RemoteChangesFetcherWidget();
// //       case DeviceConfigStep.syncingRemoteChanges:
// //         return const SyncRemoteChangesWidget();
// //     }
// //   }
// // }
