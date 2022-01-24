import 'package:flutter/material.dart';
import 'package:open_cart/screens/add_new_address_screen.dart';
import 'package:open_cart/utils/colors.dart';


class AddressPageBottomNavbarWidget extends StatelessWidget {
  const AddressPageBottomNavbarWidget({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(AddNewAddressScreen.route),
            child: Container(
              child: const Center(
                child: Text('Add new Address'),
              ),
              width: deviceSize.width / 2,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: colorDarkGrey)),
            ),
          ),
          Container(
            height: 50,
            width: deviceSize.width / 2,
            child: const Center(child: Text('Pay')),
            decoration: BoxDecoration(
                color: colorOrangeCustom,
                border: Border.all(width: 0.2, color: colorDarkGrey)),
          )
        ],
      ),
    );
  }
}

