import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:open_resto/controller/detail_restaurant_controller.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/widgets/buttons/default_button.dart';
import 'package:open_resto/widgets/buttons/rounded_button.dart';
import 'package:open_resto/widgets/cards/costumer_review_card.dart';
import 'package:open_resto/widgets/cards/food_card.dart';
import 'package:open_resto/widgets/inputs/primary_input.dart';
import 'package:open_resto/widgets/inputs/custom_textarea.dart';
import 'package:open_resto/widgets/my_app_bar.dart';
import 'package:open_resto/common/global_data.dart';

class DetailRestaurantPage extends StatelessWidget {
  DetailRestaurantPage({super.key});

  final pageController = Get.put(DetailRestaurantController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.maybeOf(context)!.size;
    return Scaffold(
      appBar: MyAppBar(
        prefixIcon: Ic.round_arrow_back_ios,
        title: "Restaurant",
        option: Obx(
          () => InkWell(
            onTap: () => pageController.isLiked.value
                ? pageController.deleteRestaurant()
                : pageController.addRestaurant(),
            child: Iconify(
              pageController.isLiked.value ? Mdi.heart : Mdi.heart_outline,
              size: spacing * 4,
              color: orange400,
            ),
          ),
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
                      // Content head
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    data.detailRestaurant.restaurant.name,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                                Text(
                                  "Indonesia",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: neutral500,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: spacing / 2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(spacing / 5),
                                  decoration: BoxDecoration(
                                    color: neutral100,
                                    borderRadius:
                                        BorderRadius.circular(radius / 2),
                                  ),
                                  child: const Iconify(
                                    Ic.round_star_border,
                                    color: orange400,
                                  ),
                                ),
                                const SizedBox(width: spacing),
                                Text(
                                  data.detailRestaurant.restaurant.rating
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: orange400,
                                      ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: spacing * 2),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(radius),
                        child: Image.network(
                            "https://restaurant-api.dicoding.dev/images/medium/${data.detailRestaurant.restaurant.pictureId}"),
                      ),
                      const SizedBox(height: spacing * 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(spacing * 1.5),
                            decoration: BoxDecoration(
                              color: orange50,
                              borderRadius: BorderRadius.circular(spacing * 2),
                            ),
                            child: const Iconify(
                              Carbon.location,
                              color: orange400,
                            ),
                          ),
                          const SizedBox(width: spacing * 2),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Location",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  data.detailRestaurant.restaurant.address!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: spacing * 2),
                          Container(
                            padding: const EdgeInsets.all(spacing * 1.5),
                            decoration: BoxDecoration(
                              color: orange50,
                              borderRadius: BorderRadius.circular(spacing * 2),
                            ),
                            child: const Iconify(
                              Ri.shopping_cart_line,
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
                        data.detailRestaurant.restaurant.description,
                        softWrap: true,
                        overflow: data.isReadMore.value == false
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        maxLines: data.isReadMore.value == false ? null : 4,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: neutral700, height: 1.3),
                      ),
                      const SizedBox(height: spacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => data.toggleReadMore(),
                            child: Text(
                              data.isReadMore.value == false
                                  ? 'Read Less'
                                  : 'Read More',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: orange400,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          const SizedBox(width: spacing),
                          Transform.rotate(
                            angle: data.isReadMore.value == false
                                ? 90 * pi / 180
                                : 270 * pi / 180,
                            child: const Iconify(
                              Ic.round_arrow_back_ios,
                              size: spacing * 2,
                              color: orange400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: spacing * 3),
                      Text(
                        "Foods",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: spacing * 2),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          itemCount: data
                              .detailRestaurant.restaurant.menus?.foods.length,
                          itemBuilder: (context, index) {
                            final menu = data.detailRestaurant.restaurant.menus
                                ?.foods[index];
                            return SizedBox(
                              width: screenSize.width - (spacing * 10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: spacing * 2),
                                child: FoodCard(data: menu!),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Drinks",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: spacing * 2),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data
                              .detailRestaurant.restaurant.menus?.drinks.length,
                          itemBuilder: (context, index) {
                            final menu = data.detailRestaurant.restaurant.menus
                                ?.drinks[index];
                            return SizedBox(
                              width: screenSize.width - (spacing * 10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: spacing * 2),
                                child: FoodCard(
                                  data: menu!,
                                  icon: Carbon.cafe,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Review",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: spacing * 2),
                      CustomTextArea(
                        inputPlaceholder: 'Write your review..',
                        onSubmitted: (e) => data.postReview(e),
                      ),
                      const SizedBox(height: spacing * 2),
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
