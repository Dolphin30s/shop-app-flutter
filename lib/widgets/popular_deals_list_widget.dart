import 'package:flutter/material.dart';
import 'package:open_cart/providers/popular_deals_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:open_cart/utils/urls.dart';
import 'package:provider/provider.dart';

class PopularDealsListWidget extends StatelessWidget {
  const PopularDealsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Consumer<PopularDealsProvider>(builder: (context, provider, _) {
        return SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.categoryList.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * (1 / 4),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(5),
                            width: 70,
                            height: 70,
                            child: Image.network(provider
                                    .categoryList[index].popularDealsImageUrl ??
                                loadErrorImageUrl),
                          ),
                          const SBH5(),
                          Text(
                              provider.categoryList[index].popularDealsName
                                  .toString(),
                              style: TextStyle(
                                  color: colorFF,
                                  fontSize: 10,
                                  fontFamily: primaryFont)),
                        ],
                      ),
                    ),
                  )),
        );
      }),
    );
  }
}
