# flutter_offline_sync

A package to enable offline sync in your Flutter Objectbox projects


### Install the package in `pubspec.yaml`

```yaml
flutter_offline_sync:
   git:
      url: https://github.com/MuhammedKasujja/flutter-offline-sync.git
      ref: main  
```

### Entity Registry for Models to support offline sync

### Add your Objectbox Entities/ Models and run the command to generate EntityRegistry project helper

```dart
dart run build_runner build --delete-conflicting-outputs
```

### The generated code will be used to upload local changes and sync remote changes in your local database

## All Models need the following fields for syncronization
### Model Required fields
1. `createdAt`
2. `updatedAt`
3. `deletedAt?`  ( deletedAt should be nullable )
4. `isSynced` ( property to track synced models to avoid duplicate syncs from going to the server)
5. `uuid?`  unique field to track the entity otherthan using auto generated objectbox primary keys `id` 

### NOTE: make sure each entity has UUID and it shoul be final

#### ID to track devices without `syncUserId`
```dart
kDefaultConnectDeviceUserID = 'user_id_unknown';
```

Note
 1. Make sure to revalidate (change) `updatedAt` whenever a database operation is made

 objectbox: ^4.3.0 required
 objectbox_flutter_libs: 4.3.0

 ### Example Usage:
```dart 
 import 'package:example/data/objectbox.dart';
 import 'package:example/generated/entity_registry.g.dart';
 import 'package:example/ui/users_screen.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter_offline_sync/flutter_offline_sync.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await ObjectBox.create(databaseName: 'users_db');

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
       syncBaseUrl: 'http://192.168.1.4:3000/api/',
       child: const MaterialApp(
         debugShowCheckedModeBanner: false,
         home: UsersScreen(),
       ),
     );
   }
 }
```