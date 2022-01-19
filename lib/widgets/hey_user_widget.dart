import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/data.dart';
import 'package:open_cart/utils/styles.dart';

class HeyUserWidget extends StatelessWidget {
  const HeyUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Hey\n',
          style: TextStyle(
              color: colorFF, fontSize: 25, fontFamily: primaryFont),
          children: <TextSpan>[
            TextSpan(
                text: '$userName,',
                style: TextStyle(color: colorOrangeCustom, fontSize: 40))
          ]),
    );
  }
}