import 'package:flutter/material.dart';

class RemoteDataPreviewWidget extends StatelessWidget {
  const RemoteDataPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Remote Changes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Download changes',
        child: Icon(Icons.sync),
      ),
    );
  }
}
