import 'package:flutter/material.dart';
import 'package:open_cart/providers/food_items_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/constants.dart';
import 'package:provider/provider.dart';

class CustomProductImageBox extends StatelessWidget {
  const CustomProductImageBox({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, provider, _) {
      return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: colorFF,
          borderRadius: bRC20,
          image: DecorationImage(
            image: NetworkImage(
              map["foodImageUrl"].toString(),
            ),
          ),
        ),
        padding: const EdgeInsets.all(5),
      );
    });
  }
}
