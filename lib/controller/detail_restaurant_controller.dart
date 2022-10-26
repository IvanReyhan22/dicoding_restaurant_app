import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:open_resto/data/api/api_service.dart';
import 'package:open_resto/data/model/detail_restaurant.dart';
import 'package:open_resto/data/model/restaurant_model.dart';

enum ResultState { idle, loading, noData, hasData, erorr }

class DetailRestaurantController extends GetxController {
  ApiService apiService = ApiService();
  var _detailRestaurant;
  final _resultState = ResultState.idle.obs;
  final RxString _message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchRestaurant();
  }

  // Accessible var
  ResultState get state => _resultState.value;
  DetailRestaurant get detailRestaurant => _detailRestaurant;
  String get message => _message.value;

  Future<dynamic> _fetchRestaurant() async {
    try {
      final Restaurant data = Get.arguments;
      _resultState.value = ResultState.loading;
      final response = await apiService.fetchRestaurant(data.id);
      if (response.checkIfDataNull()) {
        _resultState.value = ResultState.noData;
        return _message.value = "Restaurant Data is Empty";
      } else {
        _resultState.value = ResultState.hasData;
        return _detailRestaurant = response;
      }
    } catch (e) {
      _resultState.value = ResultState.erorr;
      log(e.toString());
      return _message.value = "No Internet Connection";
    }
  }
}
