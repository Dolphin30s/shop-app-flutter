import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:provider/provider.dart';

class CustomCartTileWidget extends StatelessWidget {
  const CustomCartTileWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return ListTile(
        tileColor: Colors.transparent,
        leading: Image.network(provider.cartList[index].productImage.toString(),
            fit: BoxFit.cover),
        title: Text(
          provider.cartList[index].productName.toString(),
          style: tsCOrangeCustomFFPrimaryS20,
        ),
        subtitle: Text(
          provider.cartList[index].productPrice.toString(),
          style: tsCFFS20W500,
        ),
        trailing: IconButton(
          onPressed: () {
            provider.deleteProduct(index);
          },
          icon: Icon(
            Icons.delete,
            color: colorFF,
          ),
        ),
      );
    });
  }
}
