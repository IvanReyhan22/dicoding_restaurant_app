import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:open_resto/common/styles.dart';

class ErrorTemplate extends StatelessWidget {
  final String title;
  final String iconData;
  const ErrorTemplate({super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Iconify(
          iconData,
          size: spacing * 8,
          color: neutral500,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: spacing,
            left: spacing * 2,
            right: spacing * 2,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: neutral500, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
