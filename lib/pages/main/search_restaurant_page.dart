import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/controller/search_restaurant_controller.dart';
import 'package:open_resto/data/model/restaurant_model.dart';
import 'package:open_resto/widgets/cards/restaurant_card.dart';
import 'package:open_resto/widgets/inputs/rounded_filled_input.dart';
import 'package:open_resto/widgets/my_app_bar.dart';

class SearchRestaurantPage extends StatelessWidget {
  const SearchRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(
        title: "Search Restaurant",
        option: InkWell(
          onTap: () {},
          child: const Iconify(
            Ic.baseline_bookmark_border,
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
          child: GetX<SearchRestaurantController>(
            init: SearchRestaurantController(),
            builder: (controller) {
              final state = controller.state;
              return Column(
                children: <Widget>[
                  RoundedFilledInput(
                    onChange: (e) =>
                        e.isNotEmpty ? controller.searchRestaurantData(e) : {},
                    icondata: Uil.search,
                    controller: controller.searchController,
                    focusNode: controller.focusNode,
                    inputType: TextInputType.text,
                    placeholder: "Search Restaurant",
                  ),
                  const SizedBox(height: spacing * 2),
                  if (state == ResultState.loading) ...[
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  ] else if (state == ResultState.noData) ...[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
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
                                controller.message,
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
                    )
                  ] else if (state == ResultState.hasData) ...[
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.searchRestaurant.founded,
                        itemBuilder: (context, index) {
                          final Restaurant data =
                              controller.searchRestaurant.restaurants[index];
                          return RestaurantCard(
                            restaurant: data,
                            onTap: () => Get.toNamed('/detail_restaurant',
                                arguments: data),
                          );
                        },
                      ),
                    )
                  ] else if (state == ResultState.erorr) ...[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
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
                                controller.message,
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
                    )
                  ] else ...[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Iconify(
                              Uil.search,
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
                                controller.message,
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
                    )
                  ]
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
