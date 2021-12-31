import 'package:solarized_twitter/model/tweet.dart';

class Profile {
  Profile({
    required this.name,
    required this.username,
    required this.description,
    required this.id,
    required this.url,
    required this.verifled,
    required this.location,
    required this.profileImageUrl,
    required this.pinnedTweetId,
    required this.createdAt,
  });

  String name;
  String username;
  String description;
  String id;
  String url;
  bool verifled;
  String location;
  String profileImageUrl;
  String pinnedTweetId;
  DateTime createdAt;

  Profile.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'].toString(),
        url = json['url'].toString(),
        username = json['username'].toString(),
        description = json['description'].toString(),
        verifled = json['verified'] as bool,
        location = json['location'].toString(),
        profileImageUrl = json['profile_image_url'].toString(),
        createdAt = DateTime.parse(json['created_at'].toString()),
        pinnedTweetId = json['pinned_tweet_id'].toString();
}
