import 'package:flutter/material.dart';
import 'package:open_cart/providers/address_provider.dart';
import 'package:open_cart/screens/add_new_address_screen.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:open_cart/widgets/text_form_field_widget_with_label.dart';

class AddAdressFormBodyWidget extends StatelessWidget {
  const AddAdressFormBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SBH10(),
            Text(
              'Add a new Address',
              style: tsCBlackFFPrimaryS25,
            ),
            const SBH15(),
            Column(
              children: [
                TextFormFieldWithLabelWidget(
                  label: 'Address Line 1',
                  controller: addressline1Controller,
                ),
                TextFormFieldWithLabelWidget(
                  label: 'Address Line 2',
                  controller: addressline2Controller,
                ),
                TextFormFieldWithLabelWidget(
                  label: 'City',
                  controller: cityController,
                ),
                TextFormFieldWithLabelWidget(
                  label: 'Pincode',
                  controller: pincodeController,
                ),
                ElevatedButton(
                    onPressed: () {
                      final String addressLine1 =
                          addressline1Controller.text;
                      final String addressLine2 =
                          addressline2Controller.text;
                      final String city = cityController.text;
                      final String pincode = pincodeController.text;
                      AddressProvider().addAddressDetails(
                          addressLine1: addressLine1,
                          addressLine2: addressLine2,
                          city: city,
                          pincode: pincode);

                      addressline1Controller.clear();
                      addressline2Controller.clear();
                      cityController.clear();
                      pincodeController.clear();
                    },
                    child: const Text('submit'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

