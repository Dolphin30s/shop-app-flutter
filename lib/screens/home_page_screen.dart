// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/screens/cart_screen.dart';
import 'package:open_cart/screens/favourites_screen.dart';
import 'package:open_cart/screens/products_screen.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/widgets/custom_app_drawer_widget.dart';
import 'package:open_cart/widgets/custom_bottom_navbar_widget.dart';
import 'package:open_cart/widgets/custom_sliver_appbar_widget.dart';
import 'package:open_cart/widgets/custom_sliver_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          return DefaultTabController(
            initialIndex: 0,
            length: 5,
            child: Scaffold(
              backgroundColor: homeScreenBgColor,
              drawer: CustomAppDrawerWidget(),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Stack(
                  children: [
                    TabBarView(children: [
                      CustomScrollView(
                        slivers: [
                          Consumer<CartProvider>(
                              builder: (context, provider, _) {
                            return CustomSliverAppBarWidget();
                          }),
                          CustomSliverListWidget(),
                        ],
                      ),
                      ProductsScreen(),
                      RedirectionScreen(),
                      FavouritesScreen(),
                      ProductsScreen(),
                    ]),
                    Positioned(bottom: 0, child: CustomBottomNavbar()),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _initAsync() async {
    await _cartProvider.fetchProducts();
  }
}

class RedirectionScreen extends StatefulWidget {
  const RedirectionScreen({Key? key}) : super(key: key);

  @override
  _RedirectionScreenState createState() => _RedirectionScreenState();
}

class _RedirectionScreenState extends State<RedirectionScreen> {
  @override
  void initState() {
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorDarkGrey,
        body: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: CartScreen()));
  }

  _initAsync() async {
    // await Future.delayed(const Duration(milliseconds: 100));
    Navigator.of(context).pushNamed(CartScreen.route);
  }
}
