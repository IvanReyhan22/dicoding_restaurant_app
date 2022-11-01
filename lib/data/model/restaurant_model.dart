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

  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late String? address;
  late List<Category>? categories;
  late Menus? menus;
  late List<CustomerReview>? customerReviews;

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

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "pictureId": pictureId,
      "city": city,
      "address": address,
      "rating": rating,
    };
  }

  Restaurant.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    description = map["description"];
    city = map["city"];
    address = map["address"];
    pictureId = map["pictureId"];
    rating = map["rating"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
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
