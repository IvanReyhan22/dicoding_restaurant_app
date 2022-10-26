import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_resto/common/styles.dart';
import 'package:open_resto/data/model/customer_review_model.dart';

class CostumerReviewCard extends StatelessWidget {
  final CustomerReview data;
  const CostumerReviewCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(spacing + (spacing / 2)),
        child: Row(
          children: [
            const SizedBox(
              width: spacing * 7,
              height: spacing * 7,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'http://www.pixelstalk.net/wp-content/uploads/2016/09/Free-2D-Origami-Wallpaper.png'),
              ),
            ),
            const SizedBox(width: spacing * 2),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    data.review,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: spacing),
                  Text(
                    data.date,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: neutral500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
