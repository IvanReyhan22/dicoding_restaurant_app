import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:open_resto/data/model/restaurant.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/widgets/buttons/rounded_button.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final Function onTap;

  const RestaurantCard(
      {super.key, required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius),
                  boxShadow: const [
                    BoxShadow(
                      color: neutral100,
                      spreadRadius: 6,
                      blurRadius: 4,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(spacing + (spacing / 2)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Image.network(
                        fit: BoxFit.cover,
                        restaurant.pictureId,
                        width: spacing * 12,
                        height: spacing * 12,
                      ),
                    ),
                    const SizedBox(width: spacing * 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            restaurant.city,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: neutral500),
                          ),
                          const SizedBox(height: spacing),
                          Row(
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurant.rating.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Rate',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: neutral500),
                                    )
                                  ],
                                ),
                              ),
                              const RoundedButton(title: 'Read More'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: spacing * 3)
          ],
        ),
      ),
    );
  }
}
