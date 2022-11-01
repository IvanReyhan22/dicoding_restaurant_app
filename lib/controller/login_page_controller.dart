import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:open_resto/common/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  void login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = nameController.value.text;
    if (name.isNotEmpty) {
      prefs.setString('user_name', name);
      Get.offAllNamed('/main_app');
    } else {
      showSnackbar(
          'Empty field', 'Name Field is Empty', Mdi.file_document_add_outline);
    }
  }

  void showSnackbar(String title, String subTitle, String icon) {
    Get.snackbar(
      title,
      subTitle,
      backgroundColor: orange50,
      icon: Iconify(
        icon,
        size: spacing * 4,
      ),
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 2),
    );
  }
}
