import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/data/model/category_model.dart';
import 'package:open_resto/widgets/buttons/rounded_button.dart';

class FoodCard extends StatelessWidget {
  // const FoodCard({super.key});

  final Category data;
  const FoodCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
            padding: const EdgeInsets.all(spacing + (spacing / 2)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Iconify(
                  Ic.outline_fastfood,
                  size: spacing * 7,
                ),
                const SizedBox(width: spacing * 2),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Lorem ipsum ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: neutral500),
                      ),
                      const SizedBox(height: spacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '52k ',
                            style: Theme.of(context).textTheme.headline6!,
                          ),
                          const RoundedButton(title: 'Order Now')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: spacing * 3)
      ],
    );
  }
}
