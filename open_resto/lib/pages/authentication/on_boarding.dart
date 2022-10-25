import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_resto/globals/styles.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<StatefulWidget> createState() => _StateOnBoarding();
}

class _StateOnBoarding extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/feast_white.png',
                width: spacing * 10,
                height: spacing * 10,
              ),
              const SizedBox(height: spacing * 2),
              Text(
                "FEAST",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
