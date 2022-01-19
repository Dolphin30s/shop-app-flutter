import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/styles.dart';

class WelcomeToMindsterWidget extends StatelessWidget {
  const WelcomeToMindsterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Welcome to ',
          style: TextStyle(
              color: colorFF, fontSize: 15, fontFamily: primaryFont),
          children: <TextSpan>[
            TextSpan(
                text: 'BurgerSpot',
                style: TextStyle(color: colorOrangeCustom, fontSize: 30))
          ]),
    );
  }
}
