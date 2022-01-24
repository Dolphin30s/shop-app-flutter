import 'package:flutter/material.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:open_cart/widgets/cart_list_section_widget.dart';

class OrderPreviewScreen extends StatelessWidget {
  static const String route = '/order_preview_screen.dart';
  const OrderPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const CartListSectionWidget(),
            ),
            const SBH5(),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Address',
                          style: tsAppBarTitle,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_location_alt,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(map["addressLine1"]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(map["addressLine2"]),
                            Text(map["city"]),
                            Text(map["pincode"]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SBH10(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
