import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';

class ItemBoxWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  const ItemBoxWidget(
      {Key? key,
      required this.deviceSize,
      required this.text,
      required this.imageUrl})
      : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: deviceSize.width * (1 / 4),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorRed50,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(5),
              width: 70,
              height: 70,
              child: Image.network(imageUrl),
            ),
            const SBH5(),
            Text(text, style: tsCwhiteFFPrimaryS12),
          ],
        ),
      ),
    );
  }
}
