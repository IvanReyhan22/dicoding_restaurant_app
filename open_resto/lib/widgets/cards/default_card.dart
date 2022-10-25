import 'package:flutter/material.dart';
import 'package:open_resto/globals/styles.dart';

class DefaultCard extends StatelessWidget {
  final Widget widget;
  const DefaultCard({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: neutral100,
            spreadRadius: 6,
            blurRadius: 4,
          ),
        ],
      ),
      child: widget,
    );
  }
}
