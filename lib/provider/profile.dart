import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solarized_twitter/model/profile.dart';
import 'package:solarized_twitter/model/request/twitter_request.dart';

final profileProvider =
    FutureProvider.family<Profile, String>((ref, userId) async {
  return getUserProfile(userId);
});
