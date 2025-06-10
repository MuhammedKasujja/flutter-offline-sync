import 'package:example/data/models/user_model.dart';
import 'package:example/database.dart';
import 'package:example/ui/user_edit_screen.dart';
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
    FlutterSync.setAuthToken('E98HFJE9FE90JFFF9843');
    FlutterSync.setRequestExtras({'user_id': 1});
    super.initState();
  }

  fetchUsers() async {
    final box = getBox<UserModel>();
    setState(() {
      users = box.getAll();
    });
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
                MaterialPageRoute(builder: (context) => SyncDataViewer()),
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
              subtitle: Text(user.email),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            );
          },
        ),
      ),
    );
  }
}
