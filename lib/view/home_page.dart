import 'package:flutter/material.dart';
import 'package:solarized_twitter/model/request/twitter_request.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'UserID',
            ),
            TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserID',
                )),
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) oauth(_controller.text);
              },
              child: Text('TextButton'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}