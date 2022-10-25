import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:open_resto/globals/styles.dart';

class PrimaryInput extends StatefulWidget {
  final String inputPlaceholder;
  final String iconData;
  const PrimaryInput(
      {super.key, required this.inputPlaceholder, required this.iconData});

  @override
  State<StatefulWidget> createState() => _StatePrimaryInput();
}

class _StatePrimaryInput extends State<PrimaryInput> {
  late FocusNode _focusNode;
  final _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _myController.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(spacing * 5),
          boxShadow: [
            BoxShadow(
              color: _focusNode.hasFocus ? neutral200 : lightBackground,
              spreadRadius: spacing / 4,
              blurRadius: spacing,
            )
          ]),
      child: TextField(
        controller: _myController,
        focusNode: _focusNode,
        onTap: () => _requestFocus(),
        style: const TextStyle(
          color: black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        decoration: InputDecoration(
          hintText: widget.inputPlaceholder,
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
                widget.iconData,
                size: spacing,
                color: _focusNode.hasFocus ? orange400 : neutral400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
