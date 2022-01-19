import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/widgets/categories_list_widget.dart';
import 'package:open_cart/widgets/section_heaader_widget.dart';

class CategoriesBoxWidget extends StatelessWidget {
  const CategoriesBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorGrey900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionHeaderWidget(headerText: 'Categories'),
          CategoriesListWidget(),
          CategoriesListWidget(),
          SBH10(),
        ],
      ),
    );
  }
}
