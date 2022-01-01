import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:solarized_twitter/model/profile.dart';
import 'package:twitter_login/twitter_login.dart';

final apiKey = dotenv.env['API_KEY']!;
final apiKeySecret = dotenv.env['API_KEY_SECRET']!;
Future<OauthToken> getOauthToken() async {
  final base64encoded =
      base64.encode(latin1.encode('${apiKey}:${apiKeySecret}'));

  final response = await http.post(
    Uri.parse('https://api.twitter.com/oauth2/token'),
    headers: {'Authorization': 'Basic $base64encoded'},
    body: {'grant_type': 'client_credentials'},
  );

  print(response.body);

  final oauthToken = OauthToken.fromJson(jsonDecode(response.body));
  return oauthToken;
}

Future<Profile> getUserProfile(String username) async {
  // Map<String,List<String>>
  final queryParameters = {
    'expansions': ['pinned_tweet_id'],
    'user.fields': [
      'name',
      'location',
      'profile_image_url',
      'verified',
      'url',
      'created_at',
      'description',
    ],
  };

  final oauthToken = await getOauthToken();

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
  print(result.body);

  final json = jsonDecode(result.body) as Map<String, dynamic>;
  final profile = Profile.fromJson(json['data']);

  print(json);
  return profile;
}

class OauthToken {
  final String tokenType;
  final String accessToken;

  OauthToken(this.tokenType, this.accessToken);

  OauthToken.fromJson(Map<String, dynamic> json)
      : tokenType = json['token_type'],
        accessToken = json['access_token'];
}

Future login() async {
  final twitterLogin = TwitterLogin(
    /// Consumer API keys
    apiKey: apiKey,

    /// Consumer API Secret keys
    apiSecretKey: apiKeySecret,

    /// Registered Callback URLs in TwitterApp
    /// Android is a deeplink
    /// iOS is a URLScheme
    redirectURI: 'cm-app://dev.iori.solarized_twitter',
  );

  /// Forces the user to enter their credentials
  /// to ensure the correct users account is authorized.
  /// If you want to implement Twitter account switching, set [force_login] to true
  /// login(forceLogin: true);
  final authResult = await twitterLogin.loginV2();
  switch (authResult.status) {
    case TwitterLoginStatus.loggedIn:
      // success
      print('====== Login success ======');
      break;
    case TwitterLoginStatus.cancelledByUser:
      // cancel
      print('====== Login cancel ======');
      break;
    case TwitterLoginStatus.error:
    case null:
      // error
      print('====== Login error ======');
      break;
  }
}
