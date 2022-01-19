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
    required this.index,
  }) : super(key: key);

  final Size deviceSize;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<FavouritesProvider>(builder: (context, provider, _) {
          return GestureDetector(
            onTap: () {
              print('Added to wishlist');
              FavouritesProvider().addProductToFavourites(
                  productId: provider.favouritesList[index].productName,
                  productPrice: provider.favouritesList[index].productPrice,
                  productImage: provider.favouritesList[index].productImage);
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
                  productId: provider.foodList[index].foodName,
                  productPrice: provider.foodList[index].foodprice,
                  productImage: provider.foodList[index].foodImageUrl);
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
