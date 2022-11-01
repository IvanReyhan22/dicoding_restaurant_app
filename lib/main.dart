import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:open_resto/common/custom_text_theme.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/pages/authentication/login_page.dart';
import 'package:open_resto/pages/authentication/on_boarding.dart';
import 'package:open_resto/pages/authentication/register_page.dart';
import 'package:open_resto/pages/main/detail_restaurant_page.dart';
import 'package:open_resto/pages/main_app.dart';
import 'package:open_resto/utils/background_service.dart';
import 'package:open_resto/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotification(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "RedHatDisplay",
        textTheme: customTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: orange400,
              onPrimary: black,
              secondary: orange300,
            ),
        scaffoldBackgroundColor: lightBackground,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/', page: () => const OnBoarding()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/main_app', page: () => MainApp()),
        GetPage(name: '/detail_restaurant', page: () => DetailRestaurantPage()),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => const OnBoarding()),
    );
  }
}
