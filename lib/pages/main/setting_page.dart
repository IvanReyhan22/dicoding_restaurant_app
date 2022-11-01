import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/controller/setting_page_controller.dart';
import 'package:open_resto/widgets/dialogs/custom_dialog.dart';
import 'package:open_resto/widgets/my_app_bar.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final pageController = Get.put(SettingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleAlign: TextAlign.left,
        title: "Settings",
        option: CircleAvatar(
          radius: spacing * 2.5,
          backgroundImage: NetworkImage(
              'http://www.pixelstalk.net/wp-content/uploads/2016/09/Free-2D-Origami-Wallpaper.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: spacing * 2,
          vertical: spacing * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Restaurant Notification",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "Enable Notification",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: Obx(
                    () => FlutterSwitch(
                      width: 60,
                      height: 30,
                      value: pageController.isEnabled,
                      activeColor: orange400,
                      inactiveColor: neutral400,
                      onToggle: (e) {
                        if (Platform.isIOS) {
                          customDialog(context);
                        } else {
                          pageController.toggleSwitch();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: spacing * 2),
            InkWell(
              onTap: () => pageController.logout(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Logout",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "You will be directed to login screen",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
