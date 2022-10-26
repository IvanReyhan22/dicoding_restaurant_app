import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/controller/restaurant_controller.dart';
import 'package:open_resto/widgets/cards/error_template.dart';
import 'package:open_resto/widgets/cards/restaurant_card.dart';
import 'package:open_resto/widgets/my_app_bar.dart';
import 'package:open_resto/data/model/restaurant_model.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Our Restaurant",
        option: InkWell(
          onTap: () => Get.toNamed('/search_restaurant'),
          child: const Iconify(
            Uil.search,
            color: orange400,
            size: spacing * 4,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: spacing * 2,
            vertical: spacing,
          ),
          child: GetX<RestaurantController>(
            init: RestaurantController(),
            builder: (controller) {
              final state = controller.state;
              if (state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state == ResultState.hasData) {
                return ListView.builder(
                  itemCount: controller.restaurantResult.count,
                  itemBuilder: (context, index) {
                    final Restaurant data =
                        controller.restaurantResult.restaurants[index];
                    return RestaurantCard(
                      restaurant: data,
                      onTap: () =>
                          Get.toNamed('/detail_restaurant', arguments: data),
                    );
                  },
                );
              } else if (state == ResultState.noData) {
                return Center(
                  child: ErrorTemplate(
                    title: controller.message,
                    iconData: Mdi.file_document_alert_outline,
                  ),
                );
              } else if (state == ResultState.erorr) {
                return Center(
                  child: ErrorTemplate(
                    title: controller.message,
                    iconData: Mdi.file_document_alert_outline,
                  ),
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
