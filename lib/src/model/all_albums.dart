// To parse this JSON data, do
//
//     final allAlbums = allAlbumsFromJson(jsonString);

import 'dart:convert';

List<AllAlbums> allAlbumsFromJson(String str) => List<AllAlbums>.from(json.decode(str).map((x) => AllAlbums.fromJson(x)));

String allAlbumsToJson(List<AllAlbums> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAlbums {
  int userId;
  int id;
  String title;

  AllAlbums({
    this.userId,
    this.id,
    this.title,
  });

  factory AllAlbums.fromJson(Map<String, dynamic> json) => AllAlbums(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
