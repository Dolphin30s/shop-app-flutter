import 'package:flutter/material.dart';
import 'package:open_cart/providers/category_provider.dart';
import 'package:open_cart/widgets/item_box_widget.dart';
import 'package:provider/provider.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      child: Consumer<CategoryProvider>(builder: (context, provider, _) {
        return SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.categoryList.length,
            itemBuilder: (context, index) => ItemBoxWidget(
              deviceSize: deviceSize,
              imageUrl:
                  provider.categoryList[index].categoryImageUrl.toString(),
              text: provider.categoryList[index].categoryName,
            ),
          ),
        );
      }),
    );
  }
}
