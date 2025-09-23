import 'dart:math';

import 'package:example/data/models/comment_model.dart';
import 'package:example/data/models/post_model.dart';
import 'package:example/data/models/user_model.dart';
import 'package:example/data/utils.dart';
import 'package:example/database.dart';
import 'package:example/ui/user_edit_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/flutter_offline_sync.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> users = [];

  @override
  void initState() {
    fetchUsers();
    FlutterSync.setRequestExtras({'user_id': 1});
    super.initState();
  }

  fetchUsers() async {
    final box = getBox<UserModel>();
    setState(() {
      users = box.getAll();
    });
  }

  deleteUser(int id) async {
    final user = getBox<UserModel>().get(id);
    if (user == null) return;
    if (user.deletedAt != null) {
      user.deletedAt = null; // Restore the user
    } else {
      user.deletedAt = DateTime.now(); // Soft delete the user
    }
    user.save();

    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Scaffold(
                        body: DeviceConfiguration(onDeviceSynced: () {}),
                      ),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SyncConfigurationsView(
                        isAdmin: true,
                        canConfigApi: false,
                        syncUserId: '67889',
                        viewLocalAsJson: true,
                      ),
                ),
              );
            },
            icon: Icon(Icons.preview),
          ),
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserEditScreen()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => fetchUsers(),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Row(
                spacing: 4,
                children: [
                  Text(user.email),
                  Chip(
                    label: Text(user.posts.length.toString()),
                    padding: EdgeInsets.all(1),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () => deleteUser(user.id),
                icon: Icon(
                  user.deletedAt == null ? Icons.delete : Icons.restore,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var i = 0; i < 10; i++) {
            handleSave();
          }
          fetchUsers();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void handleSave() {
    final user = UserModel(
      age: faker.vehicle.hashCode,
      email: faker.internet.email(),
      name: faker.person.name(),
      phone: faker.phoneNumber.us(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final random = Random();
    int postCount = random.nextInt(5) + 1; // Generates 1 to 5
    final List<PostModel> posts = [];
    for (var i = 0; i < postCount; i++) {
      PostModel? post = PostModel(
        title: faker.sport.name(),
        content: faker.lorem.sentence(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        uuid: getRandomString(24),
      );
      var comment =CommentModel(
        content: faker.lorem.random.string(200),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        uuid: getRandomString(24),
      );
      
      post.comment.target = comment;
      // post = post.save()!;
      posts.add(post);
    }

    user.posts.addAll([...posts]);
    user.save();
  }
}
