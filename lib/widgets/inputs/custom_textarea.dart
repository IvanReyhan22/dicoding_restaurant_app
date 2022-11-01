import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/widgets/inputs/controller/input_controller.dart';

class CustomTextArea extends StatelessWidget {
  final String inputPlaceholder;
  final TextInputType? inputType;
  final Function onSubmitted;
  const CustomTextArea(
      {super.key,
      required this.inputPlaceholder,
      this.inputType,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final InputController controller = InputController();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(spacing * 2),
        boxShadow: [
          BoxShadow(
            color: controller.focus.hasFocus ? neutral200 : lightBackground,
            spreadRadius: spacing / 4,
            blurRadius: spacing,
          )
        ],
      ),
      child: TextField(
        maxLines: 5,
        controller: controller.controller,
        focusNode: controller.focus,
        onSubmitted: (e) => onSubmitted(e),
        onTap: () => controller.requestTextFocus(),
        keyboardType: inputType ?? TextInputType.text,
        style: const TextStyle(
          color: black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        decoration: InputDecoration(
          hintText: inputPlaceholder,
          hintStyle: const TextStyle(color: neutral400),
          contentPadding: const EdgeInsets.symmetric(
            vertical: spacing * 2,
            horizontal: spacing * 3,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
