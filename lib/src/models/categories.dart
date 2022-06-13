// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

import 'dart:ui';

Categories welcomeFromMap(String str) => Categories.fromMap(json.decode(str));

String welcomeToMap(Categories data) => json.encode(data.toMap());

class Categories {
  Categories({
    this.title,
    this.image,
    this.color,
  });

  String title;
  String image;
  Color color;

  Categories copyWith({
    String title,
    String image,
    Color color,
  }) =>
      Categories(
        title: title ?? this.title,
        image: image ?? this.image,
        color: color ?? this.color,
      );

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "color": color == null ? null : color,
      };
}
