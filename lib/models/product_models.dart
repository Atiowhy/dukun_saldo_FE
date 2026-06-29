// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_models.g.dart';

List<PostModel> PostModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String PostModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PostModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "category")
  Category category;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "rating")
  Rating rating;

  PostModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

enum Category {
  @JsonValue("electronics")
  ELECTRONICS,
  @JsonValue("jewelery")
  JEWELERY,
  @JsonValue("men's clothing")
  MEN_S_CLOTHING,
  @JsonValue("women's clothing")
  WOMEN_S_CLOTHING,
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING,
});

@JsonSerializable()
class Rating {
  @JsonKey(name: "rate")
  double rate;
  @JsonKey(name: "count")
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
