import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_resto/controller/onboarding_controller.dart';
import 'package:open_resto/common/styles.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
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
