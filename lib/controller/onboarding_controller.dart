import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/login');
    });
  }
}
