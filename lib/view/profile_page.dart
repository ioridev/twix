import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twix/model/profile.dart';
import 'package:twix/provider/profile.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key, required String this.userId}) : super(key: key);

  final userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(profileProvider(userId));

    return Scaffold(
      appBar: AppBar(),
      body: userData.when(
        data: (data) => data.name.isNotEmpty
            ? SingleChildScrollView(
                child: Column(children: <Widget>[
                Image.network(data.profileImageUrl),
                Text(data.name),
                Text(data.username),
                Text(data.description),
                Text(data.url),
                Text(data.createdAt.toString()),
                Text(data.location),
                Text(data.pinnedTweetId),
              ]))
            : const Text('userData is empty.'),
        error: (error, _) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
