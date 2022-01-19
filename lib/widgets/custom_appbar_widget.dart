import 'package:flutter/material.dart';
import 'package:open_cart/screens/cart_screen.dart';
import 'package:open_cart/widgets/custom_sliver_appbar_widget.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(CartScreen.route),
                icon: const Icon(Icons.shopping_cart)),
            Positioned(top: 0, right: 3, child: CartIconWithCountWidget()),
          ],
        )
      ],
    );
  }
}
