// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/urls.dart';
import 'package:open_cart/widgets/hey_user_widget.dart';
import 'package:open_cart/widgets/set_location_dropdown_widget.dart';
import 'package:open_cart/widgets/welcome_to_mindster_widget.dart';

class CustomFlexibleSpaceBar extends StatelessWidget {
  const CustomFlexibleSpaceBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      HeyUserWidget(),
                      WelcomeToMindsterWidget(),
                      const SBH10(),
                      // SearchBarWidget(),
                      const SBH10(),
                      const SelectLocationDropdownWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.network(homePageMainImage),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
