// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:open_cart/providers/address_provider.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:open_cart/widgets/is_empty_page_body_widget.dart';
import 'package:provider/provider.dart';

class CartListSectionWidget extends StatefulWidget {
  const CartListSectionWidget({Key? key}) : super(key: key);

  @override
  _CartListSectionWidgetState createState() => _CartListSectionWidgetState();
}

class _CartListSectionWidgetState extends State<CartListSectionWidget> {
  late CartProvider _provider;
  late AddressProvider _addressProvider;
  final double totalAmount = 0.0;
  @override
  void initState() {
    _provider = CartProvider();
    _addressProvider = AddressProvider();
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
    final Size deviceSize = MediaQuery.of(context).size;
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return provider.cartList.isEmpty
          ? IsEmptyPageBodyWidget(
              deviceSize: deviceSize,
              text: 'Your cart is empty 😢!',
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
                      child: ListView.builder(
                          itemCount: provider.cartList.length,
                          itemBuilder: (context, index) {
                            print(provider.cartList);
                            return Card(
                              color: Colors.black45,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: _CustomCartTileWidget(
                                  map: provider.cartList[index].toMap(),
                                  index: index,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
    });
  }

  void _initAsync() async {
    await _provider.fetchProducts();
    await _addressProvider.fetchAddressDetails();
  }
}

class _CustomCartTileWidget extends StatelessWidget {
  const _CustomCartTileWidget({Key? key, required this.map,required this.index}) : super(key: key);
  // TODO: Change the map to class model object
  final Map map;
  final int index;
  @override
  Widget build(BuildContext context) {

    return Consumer<CartProvider>(builder: (context, provider, _) {
      return ListTile(
        tileColor: Colors.transparent,
        leading:
            Image.network(map["productImage"].toString(), fit: BoxFit.cover),
        title: Text(
          map["productName"].toString(),
          style: tsCOrangeCustomFFPrimaryS20,
        ),
        subtitle: Text(
          map["productPrice"].toString(),
          style: tsCFFS20W500,
        ),
        trailing: IconButton(
          onPressed: () async {
            await provider.deleteProduct(index);
            await provider.fetchProducts();
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
