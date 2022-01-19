import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/screens/cart_screen.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/themes.dart';
import 'package:open_cart/widgets/custom_flexible_space_bar_widget.dart'; 
import 'package:provider/provider.dart';

class CustomSliverAppBarWidget extends StatelessWidget {
  const CustomSliverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: sliverAppBarIconTheme,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.route);
                },
                icon: const Icon(Icons.shopping_cart_outlined)),
            const Positioned(top: 0, right: 3, child: CartIconWithCountWidget()),
          ],
        ),
      ],
      expandedHeight: MediaQuery.of(context).size.height / 3,
      flexibleSpace: const CustomFlexibleSpaceBar(),
    );
  }
}

class CartIconWithCountWidget extends StatefulWidget {
  const CartIconWithCountWidget({Key? key}) : super(key: key);

  @override
  _CartIconWithCountWidgetState createState() =>
      _CartIconWithCountWidgetState();
}

class _CartIconWithCountWidgetState extends State<CartIconWithCountWidget> {
  late CartProvider _cartProvider;
  @override
  void initState() {
    _cartProvider = CartProvider();
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: _cartProvider)],
        builder: (context, _) {
          return Card(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Consumer<CartProvider>(builder: (context, provider, _) {
                  return Text(
                    provider.cartList.length.toString(),
                    style: TextStyle(color: colorFF),
                  );
                }),
              ));
        });
  }

  _initAsync() async {
    await _cartProvider.fetchProducts();
  }
}
