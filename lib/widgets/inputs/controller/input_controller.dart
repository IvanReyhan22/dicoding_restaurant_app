import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  TextEditingController controller = TextEditingController();

  FocusNode focus = FocusNode();

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void requestTextFocus() {
    focus.requestFocus();
    log(focus.hasFocus.toString());
  }
}
