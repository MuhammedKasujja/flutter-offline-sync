import 'package:example/data/objectbox.dart';
import 'package:example/ui/users_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await ObjectBox.create(databaseName: 'offline_sync');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsersScreen(),
    );
  }
}
