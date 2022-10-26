import 'package:get/get.dart';
import 'package:open_resto/data/api/api_service.dart';
import 'package:open_resto/data/model/restaurant_model.dart';
import 'package:open_resto/data/model/restaurant_result_model.dart';

enum ResultState { idle, loading, noData, hasData, erorr }

class RestaurantController extends GetxController {
  final apiService = ApiService();
  var _restaurantResult;
  final _resultState = ResultState.idle.obs;
  final RxString _message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchAllRestaurant();
  }

  // Accessible var
  ResultState get state => _resultState.value;
  RestaurantResult get restaurantResult => _restaurantResult;
  String get message => _message.value;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _resultState.value = ResultState.loading;
      final response = await apiService.fetchRestaurantList();
      if (response.restaurants.isEmpty) {
        _resultState.value = ResultState.noData;
        return _message.value = "There is no restaurant available";
      } else {
        _resultState.value = ResultState.hasData;
        return _restaurantResult = response;
      }
    } catch (e) {
      _resultState.value = ResultState.erorr;
      print(e);
      return _message.value = "No Internet Connection Detected";
    }
  }
}
