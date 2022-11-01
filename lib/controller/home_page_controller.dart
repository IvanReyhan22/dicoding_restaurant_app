import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_resto/data/api/api_service.dart';
import 'package:open_resto/data/model/restaurant_result_model.dart';
import 'package:open_resto/data/model/search_restaurant.dart';
import 'package:open_resto/common/global_data.dart';

class HomePageController extends GetxController {
  final apiService = ApiService();
  var _restaurantResult, _searchRestaurant;
  final _resultState = ResultState.idle.obs;
  final RxString _message = ''.obs;
  final RxBool isSearched = false.obs;

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    fetchAllRestaurant();
  }

  // Accessible var
  SearchRestaurant get searchRestaurant => _searchRestaurant;
  ResultState get state => _resultState.value;
  RestaurantResult get restaurantResult => _restaurantResult;
  String get message => _message.value;

  Future<dynamic> fetchAllRestaurant() async {
    try {
      isSearched.value = false;
      _resultState.value = ResultState.loading;
      final response = await apiService.fetchRestaurantList();
      if (response.restaurants.isEmpty) {
        _resultState.value = ResultState.noData;
        return _message.value = "There is no restaurant available";
      } else {
        _resultState.value = ResultState.hasData;
        _message.value = "Restaurant";
        return _restaurantResult = response;
      }
    } catch (e) {
      _resultState.value = ResultState.erorr;
      return _message.value = "No Internet Connection Detected";
    }
  }

  Future<dynamic> searchRestaurantData(String query) async {
    try {
      isSearched.value = true;
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
