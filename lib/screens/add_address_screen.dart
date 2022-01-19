// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  static const String route = '/address_screen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [const Text('data')],
      ),
    );
  }
}
