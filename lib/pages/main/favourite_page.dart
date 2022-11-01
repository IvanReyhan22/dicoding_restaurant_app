import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/controller/favourite_page_controller.dart';
import 'package:open_resto/widgets/cards/error_template.dart';
import 'package:open_resto/widgets/cards/restaurant_card.dart';
import 'package:open_resto/widgets/my_app_bar.dart';
import 'package:open_resto/common/global_data.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Favourite Restaurant",
        option: Iconify(Uil.search),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: spacing,
            horizontal: spacing * 2,
          ),
          child: GetX(
            init: FavouritePageController(),
            builder: (controller) {
              final state = controller.state;
              if (state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state == ResultState.hasData) {
                final restaurant = controller.restaurants;
                return ListView.builder(
                  itemCount: restaurant.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(restaurant[index].id),
                      background: Container(color: orange50),
                      onDismissed: (e) {
                        controller.deleteRestaurant(
                          restaurant[index].id,
                        );
                      },
                      child: RestaurantCard(
                        restaurant: restaurant[index],
                        buttonClicked: () => controller.deleteRestaurant(
                          restaurant[index].id,
                        ),
                        onTap: () => Get.toNamed('/detail_restaurant',
                            arguments: restaurant[index]),
                        buttonTitle: 'Delete',
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: ErrorTemplate(
                    title: controller.message,
                    iconData: Ic.outline_sd_card_alert,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
