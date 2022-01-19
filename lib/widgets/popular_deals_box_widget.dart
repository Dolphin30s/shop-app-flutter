import 'package:flutter/material.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/widgets/popular_deals_list_widget.dart';
import 'package:open_cart/widgets/section_heaader_widget.dart';

class PopularDealsWidget extends StatelessWidget {
  const PopularDealsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionHeaderWidget(headerText: 'Popular Deals'),
          PopularDealsListWidget(),
          SBH10(),
        ],
      ),
    );
  }
}
