import 'package:example/data/models/post_model.dart';
import 'package:example/data/models/user_model.dart';
import 'package:flutter/material.dart';

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
              FilledButton(
                onPressed: () {
                  final user = UserModel(
                    age: int.tryParse(ageController.text) ?? 0,
                    email: emailController.text,
                    name: nameController.text,
                    phone: phoneController.text,
                  );
                  final postA = PostModel(
                    title: 'Killers',
                    content: 'this sucks',
                    createdAt: DateTime.now(),
                  );
                  final postB = PostModel(
                    title: 'Users',
                    content: 'This kills too',
                    createdAt: DateTime.now(),
                  );
                  final postC = PostModel(
                    title: 'Maintainers',
                    content: 'I love this',
                    createdAt: DateTime.now(),
                  );
                  user.posts.addAll([postA, postB, postC]);
                  user.save();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
