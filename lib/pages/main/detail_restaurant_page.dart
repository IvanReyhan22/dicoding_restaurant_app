import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:open_resto/data/model/restaurant.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/widgets/cards/food_card.dart';
import 'package:open_resto/widgets/my_app_bar.dart';

class DetailRestaurantPage extends StatelessWidget {
  final Restaurant restaurant;

  const DetailRestaurantPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Restaurant',
        option: Iconify(
          Mdi.heart_outline,
          size: spacing * 4,
          color: orange400,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: spacing * 2,
              right: spacing * 2,
              top: spacing,
              bottom: spacing * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Image.network(restaurant.pictureId),
                ),
                const SizedBox(height: spacing * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Container(
                      padding: const EdgeInsets.all(spacing / 2),
                      decoration: BoxDecoration(
                        color: neutral100,
                        borderRadius: BorderRadius.circular(radius / 2),
                      ),
                      child: const Iconify(
                        Ph.shopping_cart_simple_bold,
                        color: orange400,
                        size: spacing * 4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: spacing),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(spacing / 5),
                      decoration: BoxDecoration(
                        color: neutral100,
                        borderRadius: BorderRadius.circular(radius / 2),
                      ),
                      child: const Iconify(
                        Ic.round_star_border,
                        color: orange400,
                      ),
                    ),
                    const SizedBox(width: spacing),
                    Text(
                      restaurant.rating.toString(),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: orange400,
                          ),
                    ),
                    const SizedBox(width: spacing * 3),
                    Container(
                      padding: const EdgeInsets.all(spacing / 5),
                      decoration: BoxDecoration(
                        color: neutral100,
                        borderRadius: BorderRadius.circular(radius / 2),
                      ),
                      child: const Iconify(
                        Carbon.location,
                        color: orange400,
                      ),
                    ),
                    const SizedBox(width: spacing),
                    Text(
                      restaurant.city,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: orange400,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: spacing * 3),
                Text(
                  "Detail Restaurant",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: spacing),
                Text(
                  restaurant.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: neutral700, height: 1.3),
                ),
                const SizedBox(height: spacing * 4),
                Text(
                  "Foods",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: spacing * 2),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: restaurant.menus.foods.length,
                  itemBuilder: (context, index) {
                    return FoodCard(data: restaurant.menus.foods[index]);
                  },
                ),
                Text(
                  "Drinks",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: spacing * 2),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: restaurant.menus.drinks.length,
                  itemBuilder: (context, index) {
                    return FoodCard(data: restaurant.menus.drinks[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
