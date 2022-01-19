import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';
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
            bottomNavigationBar:
                CartScreenBottomSectionWidget(),
            appBar: AppBar(title: const Text('My Cart')),
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

class CartScreenBottomSectionWidget extends StatelessWidget {
  const CartScreenBottomSectionWidget({
    Key? key,

  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: 100,
      color: colorGrey700,
      child: Column(
        children: [
          Row(
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
                  SBH10(),
                  Text(
                    'Total Amount',
                    style: tsCwhiteFFPrimaryS15,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('3', style: tsCwhiteS15W300),
                  SBH10(),
                  Text('$counter\$', style: tsCwhiteS15W300),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: deviceSize.width / 2,
                color: colorFF,
                child: const Center(child: Text('Goto Homepage')),
              ),
              Container(
                  height: 50,
                  width: deviceSize.width / 2,
                  color: colorOrangeCustom,
                  child: const Center(child: Text('Checkout'))),
            ],
          ),
        ],
      ),
    );
  }
}
