import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/widgets/cart_screen_bottom_section_widget.dart';
import 'package:open_cart/widgets/custom_cart_tile_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String route = 'cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

double counter = 0;

class _CartScreenState extends State<CartScreen> {
  late CartProvider _provider;
  final double totalAmount = 0.0;
  @override
  void initState() {
    _provider = CartProvider();
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CartProvider>.value(
            value: _provider,
          ),
        ],
        builder: (context, child) {
          return Scaffold(
            bottomNavigationBar: const CartScreenBottomSectionWidget(),
            appBar: AppBar(
              title: const Text('My Cart'),
            ),
            body: _provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                      color: colorDarkGrey,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: deviceSize.height * 0.8,
                            child: Consumer<CartProvider>(
                                builder: (context, provider, _) {
                              return ListView.builder(
                                  itemCount: provider.cartList.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.black45,
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child:
                                            CustomCartTileWidget(index: index),
                                      ),
                                    );
                                  });
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }

  _initAsync() async {
    await _provider.fetchProducts();
  }
}
