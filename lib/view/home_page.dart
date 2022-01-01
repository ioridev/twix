import 'package:flutter/material.dart';
import 'package:solarized_twitter/model/request/twitter_request.dart';
import 'package:solarized_twitter/view/profile_page.dart';

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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserID',
                )),
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  getUserProfile(_controller.text);
                  Navigator.push<MaterialPageRoute<dynamic>>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              userId: _controller.text,
                            )),
                  );
                }
              },
              child: const Text('ユーザー検索'),
            ),
            TextButton(
              onPressed: () {
                login();
              },
              child: const Text('ログイン'),
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
