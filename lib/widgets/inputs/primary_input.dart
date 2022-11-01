import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/widgets/inputs/controller/input_controller.dart';

class PrimaryInput extends StatelessWidget {
  final String inputPlaceholder;
  final String iconData;
  final TextEditingController controller;
  final FocusNode focus;
  final TextInputType? inputType;
  const PrimaryInput(
      {super.key,
      required this.inputPlaceholder,
      required this.iconData,
      this.inputType,
      required this.controller,
      required this.focus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(spacing * 5),
          boxShadow: [
            BoxShadow(
              color: focus.hasFocus ? neutral200 : lightBackground,
              spreadRadius: spacing / 4,
              blurRadius: spacing,
            )
          ]),
      child: TextField(
        controller: controller,
        focusNode: focus,
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
          prefixIcon: SizedBox(
            width: spacing * 8,
            child: Padding(
              padding: const EdgeInsets.only(
                left: spacing,
                top: spacing + (spacing / 2),
                right: spacing,
                bottom: spacing + (spacing / 2),
              ),
              child: Iconify(
                iconData,
                size: spacing,
                color: focus.hasFocus ? orange400 : neutral400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
