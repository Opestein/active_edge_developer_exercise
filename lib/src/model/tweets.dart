// To parse this JSON data, do
//
//     final allTweets = allTweetsFromJson(jsonString);

import 'dart:convert';

List<Tweets> allTweetsFromJson(String str) =>
    List<Tweets>.from(json.decode(str).map((x) => Tweets.fromJson(x)));

String allTweetsToJson(List<Tweets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tweets {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Tweets({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory Tweets.fromJson(Map<String, dynamic> json) => Tweets(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
