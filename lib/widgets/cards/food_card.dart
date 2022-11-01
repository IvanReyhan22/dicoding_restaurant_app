import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/data/model/category_model.dart';

class FoodCard extends StatelessWidget {
  final Category data;
  final String? icon;
  const FoodCard({super.key, required this.data, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [
              BoxShadow(
                color: neutral100,
                spreadRadius: 4,
                blurRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(spacing * 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Iconify(
                  icon ?? Mdi.food_drumstick_outline,
                  size: spacing * 6,
                ),
                const SizedBox(width: spacing * 2),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Lorem ipsum ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: neutral500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
