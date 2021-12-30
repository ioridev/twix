import 'package:solarized_twitter/model/tweet.dart';

class Profile {
  Profile(
      {required this.name,
      required this.username,
      required this.description,
      required this.id,
      required this.pinnedTweetId,
      required this.createdAt,
      this.includes});

  String name;
  String username;
  String description;
  String id;
  String pinnedTweetId;
  DateTime createdAt;
  Tweet? includes;

  Profile.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'].toString(),
        username = json['username'].toString(),
        description = json['description'].toString(),
        createdAt = DateTime.parse(json['created_at'].toString()),
        pinnedTweetId = json['pinned_tweet_id'].toString();
  // includes = Tweet.fromJson(json['includes'] as Map<String, dynamic>);
}
