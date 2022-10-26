import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_resto/data/api/api_service.dart';
import 'package:open_resto/data/model/search_restaurant.dart';

enum ResultState { idle, loading, noData, hasData, erorr }

class SearchRestaurantController extends GetxController {
  ApiService apiService = ApiService();
  var _searchRestaurant;
  final _resultState = ResultState.idle.obs;
  final RxString _message = 'Enter name of the restaurant'.obs;

  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  // Accessible Variable
  SearchRestaurant get searchRestaurant => _searchRestaurant;
  ResultState get state => _resultState.value;
  String get message => _message.value;

  Future<dynamic> searchRestaurantData(String query) async {
    try {
      _resultState.value = ResultState.loading;
      final response = await apiService.searchRestaurant(query);
      if (response.restaurants.isEmpty) {
        _resultState.value = ResultState.noData;
        return _message.value = "Restaurant $query not found";
      } else {
        _resultState.value = ResultState.hasData;
        return _searchRestaurant = response;
      }
    } catch (e) {
      _resultState.value = ResultState.erorr;
      return _message.value = "No Internet Connection";
    }
  }
}
