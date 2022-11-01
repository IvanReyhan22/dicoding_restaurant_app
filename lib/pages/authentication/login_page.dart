import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/controller/login_page_controller.dart';
import 'package:open_resto/widgets/buttons/default_button.dart';
import 'package:open_resto/widgets/inputs/primary_input.dart';
import 'package:open_resto/widgets/my_app_bar.dart';
import 'package:open_resto/common/styles.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final pageController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/feast_black.png',
                      width: spacing * 8,
                      height: spacing * 8,
                    ),
                    const SizedBox(height: spacing),
                    Text(
                      "Welcome!",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "Sign in to Continue",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: neutral600, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: spacing * 4,
                ),
                Wrap(
                  runSpacing: spacing * 2,
                  children: [
                    PrimaryInput(
                        inputPlaceholder: "Fortune Cookie",
                        iconData: Mdi.account,
                        inputType: TextInputType.text,
                        controller: pageController.nameController,
                        focus: pageController.nameFocusNode),
                    PrimaryInput(
                      inputPlaceholder: "***********",
                      iconData: Uil.lock,
                      controller: pageController.passwordController,
                      focus: pageController.passwordFocusNode,
                    ),
                    Center(
                      child: InkWell(
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: orange400,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: spacing * 4,
                ),
                DefaultButton(
                  onPressed: () => pageController.login(),
                  title: "Login",
                  isPrimary: true,
                ),
                const SizedBox(height: spacing * 4),
                Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: spacing * 2,
                  children: [
                    // Register button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New User?",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: neutral500),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            " Create an Account?",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Or continue with",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: neutral400),
                    ),
                    // Social Login
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: spacing * 3,
                      children: [
                        SizedBox(
                          width: spacing * 7,
                          height: spacing * 7,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              shadowColor: neutral50,
                              elevation: spacing * 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(radius * 2),
                              ),
                            ),
                            child: const Iconify(Logos.google_icon),
                          ),
                        ),
                        SizedBox(
                          width: spacing * 7,
                          height: spacing * 7,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              shadowColor: neutral50,
                              elevation: spacing,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(radius * 2),
                              ),
                            ),
                            child: const Iconify(
                              Fa.facebook,
                              color: Color(0xFF4267B2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
