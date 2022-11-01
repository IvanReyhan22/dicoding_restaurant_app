import 'package:get/get.dart';
import 'package:open_resto/data/database_helper.dart';
import 'package:open_resto/data/model/restaurant_model.dart';
import 'package:open_resto/common/global_data.dart';

class FavouritePageController extends GetxController {
  final RxString _message = ''.obs;
  final _resultState = ResultState.loading.obs;
  List<Restaurant> _restaurants = [];
  late DatabaseHelper _dbHelper;

  ResultState get state => _resultState.value;
  String get message => _message.value;

  List<Restaurant> get restaurants => _restaurants;

  @override
  void onInit() {
    super.onInit();
    _dbHelper = DatabaseHelper();
    _getAllRestaurant();
  }

  void _getAllRestaurant() async {
    _resultState.value = ResultState.loading;
    _restaurants = await _dbHelper.getNotes();
    if (_restaurants.isEmpty) {
      _message.value = "Add restaurant to your favourite";
      _resultState.value = ResultState.noData;
    } else {
      _resultState.value = ResultState.hasData;
    }
  }

  Future<dynamic> deleteRestaurant(String id) async {
    await _dbHelper.deleteNote(id);
    _getAllRestaurant();
    if (_restaurants.isEmpty) {
      _message.value = "Add restaurant to your favourite";
      _resultState.value = ResultState.noData;
    } else {
      _resultState.value = ResultState.hasData;
    }
  }
}
