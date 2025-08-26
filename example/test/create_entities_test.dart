import 'dart:io';

import 'package:example/data/models/user_model.dart';
import 'package:example/data/utils.dart';
import 'package:example/objectbox.g.dart';
import 'package:test/test.dart';

void main() {
  late Store store;
  late Box<UserModel> userBox;
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp();
    store = await openStore(directory: tempDir.path);
    userBox = store.box<UserModel>();
  });

  tearDown(() {
    store.close();
    tempDir.deleteSync(recursive: true);
  });

  test('Create user with timestamps', () {
    final user1 = UserModel(
      age: 60,
      email: 'mkasujja@project.ug',
      name: 'kasujja',
      uuid: getRandomString(24),
      createdAt: DateTime.now(),
      updatedAt: DateTime(2025, 8, 22, 11, 45),
    );

    final id = userBox.put(user1);

    expect(user1.uuid, isNotNull);

    expect(user1.id, id);

    expect(user1.uuid?.length, 24);
  });

  test('Saving Multi Users with timestamps', () {
    final user1 = UserModel(
      age: 60,
      email: 'mkasujja@project.ug',
      name: 'kasujja',
      uuid: getRandomString(24),
      createdAt: DateTime(2025, 8, 18, 20, 30),
      updatedAt: DateTime(2025, 8, 22, 20, 40),
    );

    final user2 = UserModel(
      age: 45,
      email: 'joan@meddie.ug',
      name: 'Joan',
      uuid: getRandomString(24),
      createdAt: DateTime(2025, 8, 15, 15, 20),
      updatedAt: DateTime(2025, 8, 16, 08, 00),
    );

    final user3 = UserModel(
      age: 80,
      email: 'kato@main.ug',
      name: 'kato',
      uuid: getRandomString(24),
      createdAt: DateTime(2025, 8, 20, 12, 10),
      updatedAt: DateTime(2025, 8, 20, 16, 00),
    );

    final user4 = UserModel(
      age: 55,
      email: 'namuyomba@mail.com',
      name: 'Namuyomba',
      uuid: getRandomString(24),
      createdAt: DateTime(2025, 8, 14, 09, 20),
      updatedAt: DateTime(2025, 8, 20, 11, 45),
    );

    final userIds = userBox.putMany([user1, user2, user3, user4]);

    expect(userIds.length, 4);
  });
}
