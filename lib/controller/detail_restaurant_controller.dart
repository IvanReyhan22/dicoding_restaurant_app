import 'dart:developer';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:open_resto/common/global_data.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/data/api/api_service.dart';
import 'package:open_resto/data/database_helper.dart';
import 'package:open_resto/data/model/detail_restaurant.dart';
import 'package:open_resto/data/model/restaurant_model.dart';
import 'package:open_resto/data/model/review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailRestaurantController extends GetxController {
  ApiService apiService = ApiService();
  var _detailRestaurant;
  final _resultState = ResultState.idle.obs;
  final _resultReviewState = ResultState.idle.obs;
  final RxString _message = ''.obs;
  final RxBool isReadMore = true.obs;
  final RxBool isLiked = false.obs;
  final String _id = Get.arguments.id.toString();

  late DatabaseHelper _dbHelper;
  List<Restaurant> _restaurants = [];

  @override
  void onInit() {
    super.onInit();
    _dbHelper = DatabaseHelper();
    _fetchRestaurant();
    _getAllRestaurant();
    _checkIfLiked();
  }

  // Accessible var
  ResultState get state => _resultState.value;
  DetailRestaurant get detailRestaurant => _detailRestaurant;
  String get message => _message.value;

  Future<dynamic> _fetchRestaurant() async {
    try {
      _resultState.value = ResultState.loading;
      final response = await apiService.fetchRestaurant(_id);
      if (response.checkIfDataNull()) {
        _resultState.value = ResultState.noData;
        return _message.value = "Restaurant Data is Empty";
      } else {
        _resultState.value = ResultState.hasData;
        return _detailRestaurant = response;
      }
    } catch (e) {
      _resultState.value = ResultState.erorr;
      return _message.value = "No Internet Connection";
    }
  }

  Future<dynamic> postReview(String userReview) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var name = prefs.getString('user_name');
      var review = Review(id: _id, name: name!, review: userReview);
      _resultReviewState.value = ResultState.loading;
      final response = await apiService.postReview(review);
      if (response.error == false) {
        _fetchRestaurant();
        return _resultReviewState.value = ResultState.hasData;
      } else {
        return _resultReviewState.value = ResultState.noData;
      }
    } catch (e) {
      showSnackbar(
          'Failed To Post Review', 'No Internet Connection', Ph.bell_ringing);
      return _resultReviewState.value = ResultState.erorr;
    }
  }

  void toggleReadMore() {
    isReadMore.value = !isReadMore.value;
  }

  void _getAllRestaurant() async {
    _restaurants = await _dbHelper.getNotes();
    update();
  }

  Future<dynamic> addRestaurant() async {
    if (_resultState.value == ResultState.hasData) {
      await _dbHelper.insertRestaurant(_detailRestaurant.restaurant);
      isLiked.value = true;
      showSnackbar(
        'Restaurant added',
        'Restaurant added to favourite list',
        Ph.bell_ringing,
      );
    }
  }

  Future<dynamic> deleteRestaurant() async {
    await _dbHelper.deleteNote(_id);
    isLiked.value = false;
    showSnackbar(
      'Restaurant removed',
      'Restaurant removed from favourite list',
      Ph.bell_ringing,
    );
  }

  Future<dynamic> _checkIfLiked() async {
    final response = await _dbHelper.getRestaurantById(_id);
    if (response != null) {
      isLiked.value = true;
    } else {
      isLiked.value = false;
    }
  }

  void showSnackbar(String title, String subTitle, String icon) {
    Get.snackbar(
      title,
      subTitle,
      backgroundColor: orange50,
      icon: Iconify(
        icon,
        size: spacing * 4,
      ),
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 2),
    );
  }
}
