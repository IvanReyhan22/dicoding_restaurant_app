import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_resto/controller/home_page_controller.dart';

void main() {
  group("Home Page Controller :: ", () {
    test("Get All Restaurant", () async {
      var homePageController = HomePageController();

      // Retrieve all resto
      await homePageController.fetchAllRestaurant();

      var result = homePageController.restaurantResult.error;
      expect(result, false);
    });

    test("Search Restaurant", () async {
      var homePageController = HomePageController();

      // Retrieve all resto
      await homePageController.fetchAllRestaurant();
      // Get one of the restaurant name
      var searchQuery = homePageController.restaurantResult.restaurants[0].name;
      // Test
      await homePageController.searchRestaurantData(searchQuery);

      var result = homePageController.searchRestaurant.restaurants.isNotEmpty;
      expect(result, true);
    });
  });
}
