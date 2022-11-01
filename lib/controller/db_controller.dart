import 'package:get/get.dart';
import 'package:open_resto/data/database_helper.dart';
import 'package:open_resto/data/model/restaurant_model.dart';

class DbController extends GetxController {
  List<Restaurant> _restaurants = [];
  late DatabaseHelper _dbHelper;

  List<Restaurant> get restaurants => _restaurants;

  DbController() {
    _dbHelper = DatabaseHelper();
    _getAllRestaurant();
  }

  void _getAllRestaurant() async {
    _restaurants = await _dbHelper.getNotes();
    update();
  }

  Future<void> addRestaurant(Restaurant restaurant) async {
    await _dbHelper.insertRestaurant(restaurant);
    _getAllRestaurant();
  }

  Future<void> deleteNote(String id) async {
    await _dbHelper.deleteNote(id);
    _getAllRestaurant();
  }
}
