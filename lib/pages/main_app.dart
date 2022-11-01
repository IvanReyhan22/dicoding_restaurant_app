import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/controller/main_app_controller.dart';
import 'package:open_resto/utils/notification_helper.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: MainAppController(),
      builder: (controller) => Scaffold(
        body: controller.pages[controller.currentPageIndex.value],
        bottomNavigationBar: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: spacing * 2,
              horizontal: spacing * 3,
            ),
            child: GNav(
              backgroundColor: white,
              color: neutral800,
              activeColor: white,
              tabBackgroundColor: orange400,
              padding: const EdgeInsets.symmetric(
                vertical: spacing + 4,
                horizontal: spacing + 4,
              ),
              gap: spacing,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Profile',
                ),
              ],
              onTabChange: (index) => controller.setPageIndex(index),
            ),
          ),
        ),
      ),
    );
  }
}
