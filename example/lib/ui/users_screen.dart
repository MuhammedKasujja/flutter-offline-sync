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
                MaterialPageRoute(builder: (context) => DeviceConfiguration()),
              );
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SyncConfigurationsView(isAdmin: true),
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
              subtitle: Text(user.email),
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
    );
  }
}
