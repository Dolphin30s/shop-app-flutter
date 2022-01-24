import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/screens/add_address_screen.dart';
import 'package:open_cart/screens/home_page_screen.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/dialog_boxes.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:provider/provider.dart';

class CartScreenBottomSectionWidget extends StatelessWidget {
  const CartScreenBottomSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: 120,
      color: colorGrey700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Items',
                      style: tsCwhiteFFPrimaryS15,
                    ),
                    const SBH10(),
                    Text(
                      'Total Amount',
                      style: tsCwhiteFFPrimaryS15,
                    ),
                  ],
                ),
                Consumer<CartProvider>(builder: (context, provider, _) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(provider.cartList.length.toString(),
                          style: tsCwhiteS15W300),
                      const SBH10(),
                      Text('${provider.totalAmount}\$', style: tsCwhiteS15W300),
                    ],
                  );
                }),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, HomeScreen.route),
                child: Container(
                  height: 50,
                  width: deviceSize.width / 2,
                  color: colorFF,
                  child: const Center(
                    child: Text('Goto Homepage'),
                  ),
                ),
              ),
              Consumer<CartProvider>(builder: (context, provider, _) {
                return GestureDetector(
                  onTap: () => provider.cartList.isEmpty
                      ? showNoItemsInCartDialog(context)
                      : Navigator.of(context)
                          .pushReplacementNamed(AddressScreen.route),
                  child: Container(
                    height: 50,
                    width: deviceSize.width / 2,
                    color: colorOrangeCustom,
                    child: const Center(
                      child: Text('Checkout'),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
