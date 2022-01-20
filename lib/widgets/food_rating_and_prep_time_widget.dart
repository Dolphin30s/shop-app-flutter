import 'package:flutter/material.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';

class FoodRatingAndPrepTimeWidget extends StatelessWidget {
  final Map map;
  const FoodRatingAndPrepTimeWidget({Key? key, required this.map})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              map["foodRating"].toString(),
              style: tsCwhiteFFPrimaryS15,
            ),
            const SBW5(),
            Icon(
              Icons.star,
              size: 15,
              color: Colors.amber.shade400,
            )
          ],
        ),
        const SBW5(),
        Text(
          "${map['foodPrepTime'].toString()} mins",
          style: tsCwhiteFFPrimaryS12,
        ),
      ],
    );
  }
}
