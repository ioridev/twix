import 'package:solarized_twitter/model/tweet.dart';

class Profile {
  Profile(
      {required this.name,
      required this.username,
      required this.description,
      required this.id,
      required this.pinnedTweetId,
      required this.createdAt,
      required this.includes});

  String name;
  String username;
  String description;
  String id;
  String pinnedTweetId;
  DateTime createdAt;
  Tweet includes;

  Profile.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        username = json['username'] as String,
        description = json['description'] as String,
        createdAt = DateTime.parse(json['created_at'].toString()),
        pinnedTweetId = json['pinned_tweet_id'].toString(),
        includes = Tweet.fromJson(json['includes'] as Map<String, dynamic>);
}
