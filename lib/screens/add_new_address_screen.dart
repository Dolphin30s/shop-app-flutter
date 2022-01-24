// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:open_cart/providers/address_provider.dart';
import 'package:open_cart/widgets/add_new_address_screen_body_widget.dart';
import 'package:open_cart/widgets/add_new_address_screen_bottom_navbar_widget.dart';
import 'package:provider/provider.dart';

class AddNewAddressScreen extends StatefulWidget {
  static const String route = '/add_new_address_screen';
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

final TextEditingController addressline1Controller = TextEditingController();
final TextEditingController addressline2Controller = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController pincodeController = TextEditingController();

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  late AddressProvider _addressProvider;
  @override
  void initState() {
    _addressProvider = AddressProvider();
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: _addressProvider)],
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar:
                AddNewAdressScreenBottomNavBarWidget(deviceSize: deviceSize),
            appBar: AppBar(
              title: const Text('Adding your delivery address'),
            ),
            body: const AddAdressFormBodyWidget(),
          );
        });
  }

  void _initAsync() async {
    await _addressProvider.fetchAddressDetails();
  }
}
