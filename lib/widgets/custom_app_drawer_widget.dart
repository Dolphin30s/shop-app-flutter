// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:open_cart/widgets/drawer_tile_custom_widget.dart';

class CustomAppDrawerWidget extends StatelessWidget {
  final bool _isLoggedIn = false;
  const CustomAppDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: colorDarkGrey,
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                'The BurgerSpot',
                style: tsCOrangeCustomFFPrimaryS45,
              ),
            ),
          ),
          DrawerTileCustomWidget(
            title: 'My Account',
            iconData: Icons.person,
            onPressed: () {
              print('test2');
            },
          ),
          DrawerTileCustomWidget(
            title: 'Saved Addresses',
            iconData: Icons.home,
            onPressed: () {
              print('test3');
            },
          ),
          DrawerTileCustomWidget(
            title: 'Orders',
            iconData: Icons.store,
            onPressed: () {},
          ),
          DrawerTileCustomWidget(
            title: 'Deals and Offers',
            iconData: Icons.star_border,
            onPressed: () {},
          ),
          DrawerTileCustomWidget(
            title: 'Contact us',
            iconData: Icons.login,
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
