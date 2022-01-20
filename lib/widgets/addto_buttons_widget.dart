// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/providers/favourites_provider.dart';
import 'package:open_cart/providers/food_items_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:provider/provider.dart';

class AddToButtonsWidget extends StatelessWidget {
  const AddToButtonsWidget({
    Key? key,
    required this.deviceSize,
    required this.map,
  }) : super(key: key);

  final Size deviceSize;
  final Map map;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<FavouritesProvider>(builder: (context, provider, _) {
          return GestureDetector(
            onTap: () {
              print('Added to wishlist');
              FavouritesProvider().addProductToFavourites(
                  productId: map["foodName"],
                  productPrice: map["foodprice"],
                  productImage: map["foodImageUrl"]);
            },
            child: Container(
              height: 50,
              width: deviceSize.width / 2,
              color: colorFF,
              child: const Center(child: Text('Add to wishlist')),
            ),
          );
        }),
        Consumer<FoodProvider>(builder: (context, provider, _) {
          return GestureDetector(
            onTap: () {
              print('Added to cart');
              CartProvider().addProductToCart(
                  productId: map["foodName"],
                  productPrice: map["foodprice"],
                  productImage: map["foodImageUrl"]);
              showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.of(context).pop(true);
                    });
                    return const AlertDialog(
                      title: Text('Added To Cart!'),
                    );
                  });
            },
            child: Container(
                height: 50,
                width: deviceSize.width / 2,
                color: colorOrangeCustom,
                child: const Center(child: Text('Add to Cart'))),
          );
        })
      ],
    );
  }
}
