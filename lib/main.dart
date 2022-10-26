import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:open_resto/common/custom_text_theme.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/pages/authentication/login_page.dart';
import 'package:open_resto/pages/authentication/on_boarding.dart';
import 'package:open_resto/pages/authentication/register_page.dart';
import 'package:open_resto/pages/main/detail_restaurant_page.dart';
import 'package:open_resto/pages/main/restaurant_list.dart';
import 'package:open_resto/pages/main/search_restaurant_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/restauran_list', page: () => const RestaurantList()),
        GetPage(
            name: '/detail_restaurant',
            page: () => const DetailRestaurantPage()),
        GetPage(
            name: '/search_restaurant',
            page: () => SearchRestaurantPage(),
            transition: Transition.rightToLeft),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => const OnBoarding()),
    );
  }
}
