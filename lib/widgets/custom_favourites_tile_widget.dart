import 'package:flutter/material.dart'; 
import 'package:open_cart/providers/favourites_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:provider/provider.dart';

class CustomFavouritesTileWidget extends StatelessWidget {
  const CustomFavouritesTileWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouritesProvider>(builder: (context, provider, _) {
      return ListTile(
        tileColor: Colors.transparent,
        leading: Image.network(provider.favouritesList[index].productImage.toString(),
            fit: BoxFit.cover),
        title: Text(
          provider.favouritesList[index].productName.toString(),
          style: tsCOrangeCustomFFPrimaryS20,
        ),
        subtitle: Text(
          provider.favouritesList[index].productPrice.toString(),
          style: tsCFFS20W500,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: colorFF,
          ),
        ),
      );
    });
  }
}
