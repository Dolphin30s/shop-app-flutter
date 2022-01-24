import 'package:flutter/material.dart';
import 'package:open_cart/providers/address_provider.dart';
import 'package:open_cart/screens/order_preview_screen.dart';
import 'package:provider/provider.dart';

class AddressScreenBody extends StatefulWidget {
  static const String route = '/address_screen_body';
  const AddressScreenBody({Key? key}) : super(key: key);

  @override
  State<AddressScreenBody> createState() => _AddressScreenBodyState();
}

class _AddressScreenBodyState extends State<AddressScreenBody> {
  // late AddressProvider _addressProvider;
  // @override
  // void initState() {
  //   _addressProvider = AddressProvider();
  //   Future.microtask(() => _initAsync());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return
        // MultiProvider(
        //     providers: [ChangeNotifierProvider.value(value: _addressProvider)],
        //     builder: (context, _) {
        //       return
        Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AddressProvider>(builder: (context, provider, _) {
              return SizedBox(
                height: deviceSize.height,
                child: ListView.builder(
                    itemCount: provider.addressList.length,
                    itemBuilder: (context, index) {
                      final Map map = provider.addressList[index].toMap();
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  OrderPreviewScreen.route,
                                  arguments: map);
                            },
                            title: Text(
                              provider.addressList[index].addressLine1
                                  .toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.addressList[index].addressLine2
                                      .toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  provider.addressList[index].city.toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  provider.addressList[index].pincode
                                      .toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }),
          ],
        ),
      ),
    );
    // });
  }

  // void _initAsync() async {
  //   _addressProvider.fetchAddressDetails();
  // }
}
