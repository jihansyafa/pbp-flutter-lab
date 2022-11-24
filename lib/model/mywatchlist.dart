// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);
import 'dart:convert';

List<MyWatchList> watchListFromJson(String str) =>
    List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String watchListToJson(List<MyWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.rating,
    required this.releaseDate,
    required this.title,
    required this.watched,
    required this.review,
  });

  String rating;
  String releaseDate;
  String title;
  bool watched;
  String review;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
    rating: json["fields"]["rating"],
    releaseDate: json["fields"]["release_date"],
    title: json["fields"]["title"],
    watched: json["fields"]["watched"] == true,
    review: json["fields"]["review"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "release_date": releaseDate,
    "title": title,
    "watched": watched,
    "review": review,
  };
  
}