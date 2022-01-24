// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:open_cart/providers/address_provider.dart';
import 'package:open_cart/screens/add_new_address_screen.dart';
import 'package:open_cart/widgets/address_screen_body_widget.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String route = '/address_screen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

final TextEditingController addressline1Controller = TextEditingController();
final TextEditingController addressline2Controller = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController pincodeController = TextEditingController();

class _AddressScreenState extends State<AddressScreen> {
  late AddressProvider _addressProvider;
  @override
  void initState() {
    _addressProvider = AddressProvider();
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: _addressProvider)],
        builder: (context, _) {
          return Consumer<AddressProvider>(builder: (context, provider, _) {
            return provider.addressList.isEmpty
                ? const AddNewAddressScreen()
                : Scaffold(
                    // bottomNavigationBar: AddressPageBottomNavbarWidget(deviceSize: deviceSize),
                    appBar: AppBar(
                      title: const Text('Adding your delivery address'),
                    ),
                    body: const AddressScreenBody());
          });
        });
  }

  void _initAsync() async {
    await _addressProvider.fetchAddressDetails();
  }
}
