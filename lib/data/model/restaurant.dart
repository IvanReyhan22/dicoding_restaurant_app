import 'dart:convert';

import 'package:open_resto/data/model/menu.dart';

LocalRestaurant localRestaurantFromJson(String str) =>
    LocalRestaurant.fromJson(json.decode(str));

class LocalRestaurant {
  LocalRestaurant({
    required this.restaurants,
  });

  List<Restaurant> restaurants;

  factory LocalRestaurant.fromJson(Map<String, dynamic> json) =>
      LocalRestaurant(
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((e) => Restaurant.fromJson(e)).toList();
}
