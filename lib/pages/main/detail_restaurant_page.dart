import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:open_resto/controller/detail_restaurant_controller.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/widgets/cards/costumer_review_card.dart';
import 'package:open_resto/widgets/cards/food_card.dart';
import 'package:open_resto/widgets/my_app_bar.dart';

class DetailRestaurantPage extends StatelessWidget {
  const DetailRestaurantPage({super.key});

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
            child: GetX<DetailRestaurantController>(
              init: DetailRestaurantController(),
              builder: (data) {
                final state = data.state;
                if (state == ResultState.loading) {
                  return const SizedBox(
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state == ResultState.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(radius),
                        child: Image.network(
                            "https://restaurant-api.dicoding.dev/images/medium/${data.detailRestaurant.restaurant.pictureId}"),
                      ),
                      const SizedBox(height: spacing * 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              data.detailRestaurant.restaurant.name,
                              style: Theme.of(context).textTheme.headline3,
                            ),
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
                            data.detailRestaurant.restaurant.rating.toString(),
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: orange400,
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
                                Carbon.location,
                                color: orange400,
                              ),
                            ),
                            const SizedBox(width: spacing),
                            Flexible(
                              child: Text(
                                "${data.detailRestaurant.restaurant.address}, ${data.detailRestaurant.restaurant.city}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: orange400,
                                    ),
                              ),
                            ),
                          ]),
                      const SizedBox(height: spacing * 3),
                      Text(
                        "Detail Restaurant",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: spacing),
                      Text(
                        data.detailRestaurant.restaurant.description,
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
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          itemCount: data
                              .detailRestaurant.restaurant.menus?.foods.length,
                          itemBuilder: (context, index) {
                            final menu = data.detailRestaurant.restaurant.menus
                                ?.foods[index];
                            return SizedBox(
                                width: 280,
                                height: 100,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: spacing * 2),
                                  child: FoodCard(data: menu!),
                                ));
                          },
                        ),
                      ),
                      Text(
                        "Drinks",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: spacing * 2),
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data
                              .detailRestaurant.restaurant.menus?.drinks.length,
                          itemBuilder: (context, index) {
                            final menu = data.detailRestaurant.restaurant.menus
                                ?.drinks[index];
                            return SizedBox(
                                width: 280,
                                height: 100,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: spacing * 2),
                                  child: FoodCard(data: menu!),
                                ));
                          },
                        ),
                      ),
                      Text(
                        "Review",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: spacing * 2),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: data.detailRestaurant.restaurant
                            .customerReviews?.length,
                        itemBuilder: (context, index) {
                          final review = data.detailRestaurant.restaurant
                              .customerReviews?[index];
                          return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: spacing * 2),
                              child: CostumerReviewCard(data: review!));
                        },
                      ),
                    ],
                  );
                } else if (state == ResultState.noData) {
                  return SizedBox(
                    height: 500,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Iconify(
                            Mdi.file_document_alert_outline,
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
                              data.message,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: neutral500,
                                      fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 500,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Iconify(
                            Mdi.file_document_alert_outline,
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
                              data.message,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: neutral500,
                                      fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
