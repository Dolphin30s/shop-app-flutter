import 'package:flutter/material.dart';
import 'package:open_cart/providers/cart_provider.dart';
import 'package:open_cart/providers/favourites_provider.dart';
import 'package:open_cart/providers/food_items_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/constants.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:open_cart/utils/urls.dart';
import 'package:open_cart/widgets/addto_buttons_widget.dart';
import 'package:open_cart/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String route = '/product_detail_screen';
  const ProductDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late FoodProvider _foodProvider;
  late CartProvider _cartProvider;

  @override
  void initState() {
    _foodProvider = FoodProvider();
    _cartProvider = CartProvider();

    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  void dispose() {
    _foodProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    final deviceSize = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FoodProvider>.value(value: _foodProvider),
          ChangeNotifierProvider(create: (context) => FavouritesProvider()),
          ChangeNotifierProvider.value(value: _cartProvider),
        ],
        builder: (context, child) {
          return Consumer<FoodProvider>(builder: (context, provider, _) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Scaffold(
                bottomNavigationBar:
                    AddToButtonsWidget(deviceSize: deviceSize, index: index),
                body: SingleChildScrollView(
                  child: Container(
                    color: colorDarkGrey,
                    width: deviceSize.width,
                    child: Column(
                      children: [
                        Consumer<CartProvider>(builder: (context, provider, _) {
                          return CustomAppBarWidget();
                        }),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: deviceSize.width,
                                height: deviceSize.height / 2,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: bRC20,
                                    image: DecorationImage(
                                        image: NetworkImage(provider
                                                .foodList[index].foodImageUrl ??
                                            loadErrorImageUrl),
                                        fit: BoxFit.cover)),
                              ),
                              const SBH30(),
                              Text(
                                provider.foodList[index].foodName,
                                style: tsCOrangeCustomFFPrimaryS30,
                              ),
                              const SBH20(),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                provider.foodList[index].isVeg
                                                    ? Colors.green
                                                    : colorRed,
                                            width: 1)),
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                      child: Icon(Icons.circle,
                                          size: 15,
                                          color: provider.foodList[index].isVeg
                                              ? Colors.green
                                              : colorRed),
                                    ),
                                  ),
                                  const SBW20(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            provider.foodList[index].foodRating
                                                .toString(),
                                            style: tsCwhiteFFPrimaryS15,
                                          ),
                                          const SBW5(),
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.amber.shade400,
                                          )
                                        ],
                                      ),
                                      const SBW5(),
                                      Text(
                                        "${provider.foodList[index].foodPrepTime.toString()} mins",
                                        style: tsCwhiteFFPrimaryS12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SBH20(),
                              Text(
                                provider.foodList[index].foodDetails,
                                style: tsCwhiteS15W300,
                              ),
                              const SBH20(),
                              Consumer<FoodProvider>(
                                  builder: (context, provider, _) {
                                return Text(
                                  provider.foodList[index].foodprice.toString(),
                                  style: tsCwhiteS30W800,
                                );
                              }),
                              const SBH20(),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: colorGrey700, borderRadius: bRC20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'History',
                                        style: tsCOrangeCustomFFPrimaryS20,
                                      ),
                                      const SBH5(),
                                      Text(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
                                        style: tsCwhiteS10W300,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          });
        });
  }

  _initAsync() async {
    await _foodProvider.fetchProducts();
    await _cartProvider.fetchProducts();
  }
}
