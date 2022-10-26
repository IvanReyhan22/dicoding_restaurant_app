import 'package:open_resto/data/model/category_model.dart';
import 'package:open_resto/data/model/customer_review_model.dart';
import 'package:open_resto/data/model/menu_model.dart';

class Restaurant {
  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      this.address,
      this.categories,
      this.menus,
      this.customerReviews});

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final String? address;
  final List<Category>? categories;
  final Menus? menus;
  final List<CustomerReview>? customerReviews;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"] ?? null,
        pictureId: json["pictureId"],
        rating: json["rating"].toDouble(),
        categories: json["categories"] != null
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)))
            : null,
        menus: json["menus"] != null ? Menus.fromJson(json["menus"]) : null,
        customerReviews: json["customerReviews"] != null
            ? List<CustomerReview>.from(
                json["customerReviews"].map((x) => CustomerReview.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address ?? null,
        "pictureId": pictureId,
        "rating": rating,
        "categories": categories != null
            ? List<dynamic>.from(categories!.map((x) => x.toJson()))
            : null,
        "menus": menus != null ? menus!.toJson() : null,
        "customerReviews": customerReviews != null
            ? List<dynamic>.from(customerReviews!.map((x) => x.toJson()))
            : null,
      };
}
