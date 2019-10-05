// To parse this JSON data, do
//
//     final albumPhotos = albumPhotosFromJson(jsonString);

import 'dart:convert';

List<AlbumPhotos> albumPhotosFromJson(String str) => List<AlbumPhotos>.from(json.decode(str).map((x) => AlbumPhotos.fromJson(x)));

String albumPhotosToJson(List<AlbumPhotos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumPhotos {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumPhotos({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory AlbumPhotos.fromJson(Map<String, dynamic> json) => AlbumPhotos(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
