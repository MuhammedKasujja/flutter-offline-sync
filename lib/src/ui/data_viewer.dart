import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/data/services/sync_repository.dart';

class SyncDataViewer extends StatelessWidget {
  const SyncDataViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: SyncRepositoryImp().getPendingLocalUpdates(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(child: Text('No local updates available'));
              }
              return _jsonViewer(snapshot.data);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Widget _jsonViewer(dynamic json) {
  if (json is Map<String, dynamic>) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          json.entries.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${e.key}: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: _jsonViewer(e.value)),
              ],
            );
          }).toList(),
    );
  } else if (json is List) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          json.asMap().entries.map((entry) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('[${entry.key}]: '),
                Expanded(child: _jsonViewer(entry.value)),
              ],
            );
          }).toList(),
    );
  } else {
    return Text(json.toString());
  }
}
