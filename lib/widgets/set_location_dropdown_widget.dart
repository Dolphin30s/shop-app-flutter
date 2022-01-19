import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';

class SelectLocationDropdownWidget extends StatelessWidget {
  const SelectLocationDropdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: colorOrangeCustom,
        ),
        const SBW5(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CyberPark',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: colorFF,
                  fontFamily: primaryFont),
            ),
            Text(
              'Palazhi, Bypass, Calicut',
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: colorFF, fontSize: 10),
            ),
          ],
        ),
        // Icon(
        //   Icons.keyboard_arrow_down_rounded,
        //   color: colorFF,
        // )
      ],
    );
  }
}
