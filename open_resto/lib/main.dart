import 'package:flutter/material.dart';
import 'package:open_resto/Model/restaurant.dart';
import 'package:open_resto/globals/custom_text_theme.dart';
import 'package:open_resto/globals/styles.dart';
import 'package:open_resto/pages/authentication/login_page.dart';
import 'package:open_resto/pages/authentication/on_boarding.dart';
import 'package:open_resto/pages/authentication/register_page.dart';
import 'package:open_resto/pages/main/detail_restaurant_page.dart';
import 'package:open_resto/pages/main/restaurant_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoarding(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/restauran_list': (context) => const RestaurantList(),
        '/detail_restaurant': (context) => DetailRestaurantPage(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}
