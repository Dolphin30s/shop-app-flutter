import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/styles.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String headerText;
  const SectionHeaderWidget({Key? key, required this.headerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        headerText,
        style: TextStyle(
            color: colorFF, fontSize: 20, fontFamily: primaryFont),
      ),
    );
  }
}
