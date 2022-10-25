import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:open_resto/globals/styles.dart';
import 'package:open_resto/widgets/my_app_bar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(spacing * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                MyAppBar(
                  option: Iconify(
                    Ph.x_bold,
                    color: orange400,
                    size: spacing * 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
