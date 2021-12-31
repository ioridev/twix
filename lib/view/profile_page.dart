import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solarized_twitter/model/profile.dart';
import 'package:solarized_twitter/provider/profile.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key, required String this.userId}) : super(key: key);

  final userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(profileProvider(userId));

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: userData.when(
            data: (data) => data.name.isNotEmpty
                ? Text(data.name)
                : const Text('userData is empty.'),
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}
