import 'package:flutter/material.dart'; 
import 'package:open_cart/providers/favourites_provider.dart';
import 'package:open_cart/utils/colors.dart'; 
import 'package:open_cart/widgets/custom_favourites_tile_widget.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatefulWidget {
  static const String route = 'cart_screen';
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late FavouritesProvider _provider;
  final double totalAmount = 0.0;
  @override
  void initState() {
    _provider = FavouritesProvider();
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
          ChangeNotifierProvider<FavouritesProvider>.value(
            value: _provider,
          ),
        ],
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Wishlist'),
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
                            height: deviceSize.height,
                            child: Consumer<FavouritesProvider>(
                                builder: (context, provider, _) {
                              return ListView.builder(
                                  itemCount: provider.favouritesList.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.black45,
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child:
                                            CustomFavouritesTileWidget(index: index),
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
