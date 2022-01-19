// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:open_cart/providers/category_provider.dart';
import 'package:open_cart/providers/popular_deals_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/constants.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/widgets/categories_box_widget.dart';
import 'package:open_cart/widgets/popular_deals_box_widget.dart';
import 'package:provider/provider.dart';

class CustomSliverListWidget extends StatefulWidget {
  const CustomSliverListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSliverListWidget> createState() => _CustomSliverListWidgetState();
}

class _CustomSliverListWidgetState extends State<CustomSliverListWidget> {
  late CategoryProvider _provider;
  late PopularDealsProvider _popularProvider;

  @override
  void initState() {
    _provider = CategoryProvider();
    _popularProvider = PopularDealsProvider();

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoryProvider>.value(value: _provider),
          ChangeNotifierProvider<PopularDealsProvider>.value(
              value: _popularProvider),
        ],
        builder: (context, _) {
          return Consumer<CategoryProvider>(builder: (context, provider, _) {
            return SliverList(
                delegate: SliverChildListDelegate([
              provider.isLoading
                  ? const SizedBox(
                      height: 400,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(2),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorOrangeCustom,
                        borderRadius: const BorderRadius.only(
                          topLeft: rC30,
                          topRight: rC30,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: colorGrey900,
                          borderRadius: const BorderRadius.only(
                            topLeft: rC30,
                            topRight: rC30,
                          ),
                        ),
                        child: Column(
                          children: const [
                            ScrollingPositionIndiacatorWidget(),
                            CategoriesBoxWidget(),
                            SBH10(),
                            PopularDealsWidget(),
                            SBH10(),
                            CategoriesBoxWidget(),
                            SBH10(),
                            CategoriesBoxWidget(),
                          ],
                        ),
                      ),
                    )
            ]));
          });
        });
  }

  Future<void> _initAsync() async {
    await _provider.fetchProducts();
    await _popularProvider.fetchProducts();
  }
}

class ScrollingPositionIndiacatorWidget extends StatelessWidget {
  const ScrollingPositionIndiacatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(color: colorFF, borderRadius: bRC50),
            width: 80,
            height: 3,
          ),
        ),
        const SBH5(),
        Center(
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white30, borderRadius: bRC50),
            width: 70,
            height: 2,
          ),
        ),
      ],
    );
  }
}
