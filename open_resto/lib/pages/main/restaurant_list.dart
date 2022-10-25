import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/Model/restaurant.dart';
import 'package:open_resto/globals/styles.dart';
import 'package:open_resto/widgets/cards/restaurant_card.dart';
import 'package:open_resto/widgets/my_app_bar.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<StatefulWidget> createState() => _StateRestaurantList();
}

class _StateRestaurantList extends State<RestaurantList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Our Restaurant",
        option: Iconify(
          Uil.search,
          color: orange400,
          size: spacing * 4,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: spacing * 2, vertical: spacing),
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/local_restaurant.json'),
            builder: (context, snapshot) {
              final List<Restaurant> restaurants =
                  parseRestaurant(snapshot.data);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    onTap: () => Navigator.pushNamed(
                        context, '/detail_restaurant',
                        arguments: restaurants[index]),
                    restaurant: restaurants[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
