import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:solarized_twitter/model/profile.dart';
import 'package:solarized_twitter/provider/profile.dart';

void oauth(String username) async {
  final _apiKey = dotenv.env['API_KEY']!;
  final _apiKeySecret = dotenv.env['API_KEY_SECRET']!;
  final base64encoded =
      base64.encode(latin1.encode('${_apiKey}:${_apiKeySecret}'));

  final response = await http.post(
    Uri.parse('https://api.twitter.com/oauth2/token'),
    headers: {'Authorization': 'Basic $base64encoded'},
    body: {'grant_type': 'client_credentials'},
  );

  print(response.body);

  final oauthToken = OauthToken.fromJson(jsonDecode(response.body));

  // Map<String,List<String>>
  final queryParameters = {
    'expansions': ['pinned_tweet_id'],
    'user.fields': [
      'name',
      'created_at',
      'description',
    ],
  };

  // join request queryParameters
  final params = queryParameters.entries.map((paramEntry) {
    final value = paramEntry.value.join(',');
    return '${paramEntry.key}=$value';
  }).reduce((param1, param2) {
    return '${param1}&${param2}';
  });

  final result = await http.get(
    Uri.parse('https://api.twitter.com/2/users/by/username/$username?$params'),
    headers: {'Authorization': 'Bearer ${oauthToken.accessToken}'},
  );

  final json = jsonDecode(result.body) as Map<String, dynamic>;
  final profile = Profile.fromJson(json['data']);

  print(profile);
}

class OauthToken {
  final String tokenType;
  final String accessToken;

  OauthToken(this.tokenType, this.accessToken);

  OauthToken.fromJson(Map<String, dynamic> json)
      : tokenType = json['token_type'],
        accessToken = json['access_token'];
}
