import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/controller/home_page_controller.dart';
import 'package:open_resto/data/model/restaurant_model.dart';
import 'package:open_resto/widgets/cards/error_template.dart';
import 'package:open_resto/widgets/cards/restaurant_card.dart';
import 'package:open_resto/widgets/inputs/rounded_filled_input.dart';
import 'package:open_resto/widgets/my_app_bar.dart';
import 'package:open_resto/common/global_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        prefixIcon: Ri.menu_2_fill,
        title: "Let's Feast",
        option: CircleAvatar(
          radius: spacing * 2.5,
          backgroundImage: NetworkImage(
              'http://www.pixelstalk.net/wp-content/uploads/2016/09/Free-2D-Origami-Wallpaper.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: spacing,
          left: spacing * 2,
          right: spacing * 2,
        ),
        child: GetX(
          init: HomePageController(),
          builder: (controller) {
            final state = controller.state;
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RoundedFilledInput(
                        icondata: Uil.search,
                        controller: controller.searchController,
                        focusNode: controller.searchFocusNode,
                        inputType: TextInputType.text,
                        placeholder: "Search Restaurant",
                        onChange: (e) => e.isNotEmpty
                            ? controller.searchRestaurantData(e)
                            : controller.fetchAllRestaurant(),
                      ),
                    ),
                    const SizedBox(width: spacing),
                    Container(
                      padding: const EdgeInsets.all(spacing * 2),
                      decoration: BoxDecoration(
                        color: orange50,
                        borderRadius: BorderRadius.circular(spacing * 2),
                      ),
                      child: Transform.rotate(
                        angle: 90 * pi / 180,
                        child: const Iconify(
                          Ion.ios_settings_strong,
                          color: orange400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: spacing * 2),
                if (state == ResultState.loading) ...[
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ] else if (state == ResultState.hasData) ...[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.isSearched == false
                          ? controller.restaurantResult.count
                          : controller.searchRestaurant.restaurants.length,
                      itemBuilder: (context, index) {
                        final Restaurant data = controller.isSearched == false
                            ? controller.restaurantResult.restaurants[index]
                            : controller.searchRestaurant.restaurants[index];
                        return RestaurantCard(
                          restaurant: data,
                          onTap: () => Get.toNamed('/detail_restaurant',
                              arguments: data),
                          buttonClicked: () {},
                        );
                      },
                    ),
                  )
                ] else if (state == ResultState.noData ||
                    state == ResultState.erorr) ...[
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: ErrorTemplate(
                        title: controller.message,
                        iconData: Ic.outline_sd_card_alert,
                      ),
                    ),
                  ),
                ] else ...[
                  ErrorTemplate(
                    title: controller.message,
                    iconData: Ic.outline_sd_card_alert,
                  ),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
