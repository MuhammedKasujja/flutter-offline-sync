import 'dart:math';

import 'package:example/data/models/comment_model.dart';
import 'package:example/data/models/post_model.dart';
import 'package:example/data/models/user_model.dart';
import 'package:example/data/utils.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class UserEditScreen extends StatefulWidget {
  const UserEditScreen({super.key});

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              FilledButton(onPressed: handleSave, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }

  void handleSave() {
    final user = UserModel(
      age: int.tryParse(ageController.text) ?? 0,
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final random = Random();
    int postCount = random.nextInt(5) + 1; // Generates 1 to 5
    final List<PostModel> posts = [];
    for (var i = 0; i < postCount; i++) {
      final post = PostModel(
        title: faker.sport.name(),
        content: faker.lorem.sentence(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        uuid: getRandomString(24),
      );
      var comment = CommentModel(
        content: faker.lorem.random.string(200),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      post.comment.target = comment;
      posts.add(post);
    }

    user.posts.addAll([...posts]);
    user.save();

    // Navigator.pop(context);
  }
}
