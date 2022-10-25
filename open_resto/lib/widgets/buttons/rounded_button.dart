import 'package:flutter/material.dart';
import 'package:open_resto/globals/styles.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  const RoundedButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: spacing,
        horizontal: spacing + (spacing / 2),
      ),
      decoration: BoxDecoration(
        color: neutral100,
        borderRadius: BorderRadius.circular(radius / 2),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: orange400, fontWeight: FontWeight.w500),
      ),
    );
  }
}
