import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';

class OrSeperatorWidget extends StatelessWidget {
  const OrSeperatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: colorDarkGrey, width: 0.1)),
        ),
      ),
      const SBW10(),
      Text(
        'Or',
        style: tsS20,
      ),
      const SBW10(),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: colorDarkGrey, width: 0.1)),
        ),
      ),
    ]);
  }
}
