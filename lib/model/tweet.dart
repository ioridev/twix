class Tweet {
  Tweet({
    required this.id,
    required this.text,
  });

  String id;
  String text;

  Tweet.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        text = json['text'] as String;
}
