import 'dart:io';

import 'package:example/data/models/user_model.dart';
import 'package:example/objectbox.g.dart';
import 'package:flutter_test/flutter_test.dart';

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

  test('Create User', () {
    final user = UserModel(age: 30, email: 'kato@gmail.com', name: 'Musa');

    final id = userBox.put(user);

    expect(id, isNonZero);

    final storedUser = userBox.get(id);

    expect(storedUser?.name, 'Musa');
  });

  // test('Create User', (){
  //   var user = UserModel(age: 30, email: 'kato@gmail.com', name: 'Musa');

  //   final savedUser = user.save();

  //   expect(savedUser?.id, isNonZero);

  //   final storedUser = userBox.get(savedUser?.id);

  //   expect(storedUser?.name, 'Musa');
  // });
}
