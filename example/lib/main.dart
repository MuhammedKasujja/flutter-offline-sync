import 'package:example/data/objectbox.dart';
import 'package:example/generated/entity_registry.g.dart';
import 'package:example/ui/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/flutter_offline_sync.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBox.create(databaseName: 'offline_sync_example');

  await FlutterSync.init(
    registry: ObjectboxSyncRegistry(ObjectBox.instance.store),
    initEntityChecker: null,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSyncProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UsersScreen(),
      ),
    );
  }
}
