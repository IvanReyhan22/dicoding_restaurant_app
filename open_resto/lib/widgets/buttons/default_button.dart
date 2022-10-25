import 'package:flutter/material.dart';
import 'package:open_resto/globals/styles.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final bool isPrimary;
  final Function onPressed;

  const DefaultButton(
      {super.key,
      required this.title,
      required this.isPrimary,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? black : Colors.white,
          shadowColor: neutral200,
          elevation: isPrimary ? spacing * 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius * 2),
            side: BorderSide(
              color: isPrimary ? black : neutral300,
              width: isPrimary ? 0.0 : spacing / 4,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: spacing * 2),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: isPrimary ? Colors.white : neutral700),
          ),
        ),
      ),
    );
  }
}
