import 'package:example/data/models/user_model.dart';
import 'package:example/data/utils.dart';

class UserTestData {
  static UserModel userKasujja = UserModel(
    age: 60,
    email: 'mkasujja@project.ug',
    name: 'kasujja',
    uuid: getRandomString(24),
    createdAt: DateTime(2025, 8, 18, 20, 30),
    updatedAt: DateTime(2025, 8, 22, 20, 40),
  );

  static UserModel userJoan = UserModel(
    age: 45,
    email: 'joan@meddie.ug',
    name: 'Joan',
    uuid: getRandomString(24),
    createdAt: DateTime(2025, 8, 15, 15, 20),
    updatedAt: DateTime(2025, 8, 16, 08, 00),
  );

  static final userKato = UserModel(
    age: 80,
    email: 'kato@main.ug',
    name: 'kato',
    uuid: getRandomString(24),
    createdAt: DateTime(2025, 8, 20, 12, 10),
    updatedAt: DateTime(2025, 8, 20, 16, 00),
  );

  static UserModel userNamuyomba = UserModel(
    age: 55,
    email: 'namuyomba@mail.com',
    name: 'namuyomba',
    uuid: getRandomString(24),
    createdAt: DateTime(2025, 8, 14, 09, 20),
    updatedAt: DateTime(2025, 8, 20, 11, 45),
  );

  static List<UserModel> userList() => [
    userKasujja,
    userJoan,
    userKato,
    userNamuyomba,
  ];
}
