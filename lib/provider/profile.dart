import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twix/model/profile.dart';
import 'package:twix/model/request/twitter_request.dart';

final profileProvider =
    FutureProvider.autoDispose.family<Profile, String>((ref, userId) async {
  return getUserProfile(userId);
});
