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
dart run build_runner build
```

### The generated code will be used to upload local changes and sync remote changes in your local database