import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'UserID',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
