import 'package:get/get.dart';
import 'package:open_resto/pages/main/favourite_page.dart';
import 'package:open_resto/pages/main/home_page.dart';
import 'package:open_resto/pages/main/setting_page.dart';

class MainAppController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  final pages = [const HomePage(), const FavouritePage(), SettingPage()];

  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }
}
