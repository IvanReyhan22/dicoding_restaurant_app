import 'dart:developer';

import 'package:debounce_builder/debounce_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:open_resto/common/styles.dart';

class RoundedFilledInput extends StatelessWidget {
  final String icondata;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType inputType;
  final String? placeholder;
  final Function(String) onChange;

  const RoundedFilledInput(
      {super.key,
      required this.icondata,
      required this.controller,
      required this.focusNode,
      required this.inputType,
      this.placeholder,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(spacing * 5),
      ),
      child: DebounceBuilder(
        delay: const Duration(milliseconds: 250),
        builder: (context, debounce) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            onTap: () {},
            onChanged: (e) => debounce(() => onChange(e)),
            keyboardType: inputType,
            style: const TextStyle(
              color: black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
            decoration: InputDecoration(
              hintText: placeholder ?? "",
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
                    icondata,
                    size: spacing,
                    color: focusNode.hasFocus ? orange400 : neutral400,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
