import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:open_resto/data/model/detail_restaurant.dart';
import 'package:open_resto/data/model/restaurant_result_model.dart';
import 'package:open_resto/data/model/search_restaurant.dart';

class ApiService {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantResult> fetchRestaurantList() async {
    final response = await http.get(Uri.parse("${_baseUrl}/list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<DetailRestaurant> fetchRestaurant(String id) async {
    final response = await http.get(Uri.parse("${_baseUrl}/detail/${id}"));
    if (response.statusCode == 200) {
      return DetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant data');
    }
  }

  Future<SearchRestaurant> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse("${_baseUrl}/search?q=${query}"));
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant data');
    }
  }
}
