// ignore_for_file: avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_cart/models/address_model.dart';
import 'package:open_cart/models/base_model.dart';
import 'package:open_cart/models/payment_modes_model.dart';
import 'package:open_cart/providers/_mixins.dart';
import 'package:open_cart/providers/address_provider.dart';
import 'package:open_cart/providers/base_provider.dart';
import 'package:open_cart/providers/payments_model_provider.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/constants.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatefulWidget {
  static const String route = "/test_screen";

  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late AddressProvider _addressProvider;
  late PaymentModelsModelProvider _paymentModelsModelProvider;
  AddressModel _value = AddressModel();
  PaymentModesModel _paymentMode = PaymentModesModel();
  @override
  void initState() {
    _addressProvider = AddressProvider();
    _paymentModelsModelProvider = PaymentModelsModelProvider();
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // AddressModel _value = AddressModel();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<_ThisProvider>(
            create: (context) => _ThisProvider(),
          ),
          ChangeNotifierProvider.value(value: _paymentModelsModelProvider)
        ],
        builder: (context, _) {
          return Scaffold(
            // backgroundColor: colorFF,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer2<AddressProvider, _ThisProvider>(
                      builder: (context, _addressProvider, _thisProvider, _) {
                    return SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: _addressProvider.addressList.length,
                        itemBuilder: (context, index) {
                          print(index);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              tileColor: colorFF,
                              shape:
                                  RoundedRectangleBorder(borderRadius: bRC30),
                              leading: Radio<AddressModel>(
                                  value: _addressProvider.addressList[index],
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                      _thisProvider.addAddressValue(
                                          map: _value.toMap());
                                    });
                                  }),
                              title: Text(_addressProvider
                                  .addressList[index].addressLine1!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_addressProvider
                                      .addressList[index].addressLine1!),
                                  Text(_addressProvider
                                      .addressList[index].city!),
                                  Text(_addressProvider
                                      .addressList[index].pincode!),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  const SBH20(),
                  Consumer2<PaymentModelsModelProvider, _ThisProvider>(
                      builder: (context, _paymentsProvider, _thisProvider, _) {
                    return SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: _paymentsProvider.paymentModes.length,
                        itemBuilder: (context, index) {
                          print('paymentIndex:$index');
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                tileColor: colorFF,
                                shape:
                                    RoundedRectangleBorder(borderRadius: bRC20),
                                leading: Radio<PaymentModesModel>(
                                    value:
                                        _paymentsProvider.paymentModes[index],
                                    groupValue: _paymentMode,
                                    onChanged: (value) {
                                      setState(() {
                                        _paymentMode = value!;
                                        _thisProvider.addPaymentValue(
                                            map: _paymentMode.toMap());
                                      });
                                    }),
                                title: Text(_paymentsProvider
                                    .paymentModes[index].paymentMode!),
                                trailing: FaIcon(IconData(int.parse(
                                    _paymentsProvider
                                        .paymentModes[index].paymentIcon
                                        .toString())))),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        });
  }

  _initAsync() async {
    // await Future.delayed(const Duration(seconds: 2));

    await _addressProvider.fetchAddressDetails();
    await _paymentModelsModelProvider.fetchPayments();
    _value = context.read<AddressProvider>().addressList[0];
    _paymentMode = context.read<PaymentModelsModelProvider>().paymentModes[0];
  }
}

class _ThisModel extends BaseModel {
  final int val;
  _ThisModel({required this.val});

  factory _ThisModel.fromMap(Map<String, dynamic> data) {
    return _ThisModel(
      val: data["val"],
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        "val": val,
      };
}

class _ThisProvider extends BaseProvider with MixinProgressProvider {
  List<_ThisModel> _val = <_ThisModel>[];

  List<_ThisModel> get val => _val;

  set val(List<_ThisModel> val) {
    _val = val;
    notifyListeners();
  }

  // Future<_ThisModel?> fetchTestValue() async {
  //   isLoading = true;

  //   try {} catch (ex) {
  //     print(ex.toString());
  //   } finally {
  //     isLoading = false;
  //   }
  // }

  Future<void> addAddressValue({required map}) async {
    final val = FirebaseFirestore.instance.collection("test");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final userVal = await FirebaseFirestore.instance
        .collection("addresses")
        .where('userId', isEqualTo: userId)
        .get();
    final String _id = userVal.docs.first.id;
    return val.doc(_id).update({
      'userId': userId,
      'addressLine1': map["addressLine1"],
      'addressLine2': map["addressLine2"],
      'city': map["city"],
      'pincode': map["pincode"],
    }).then((value) {
      print('sucessful');
    });
  }

  Future<void> addPaymentValue({required map}) async {
    final val = FirebaseFirestore.instance.collection("test");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final userVal = val.where("userId", isEqualTo: userId);
    // final userVal =
    //     await FirebaseFirestore.instance.collection("paymentModes").get();
    var newVal = await userVal.get();
    final String _id = newVal.docs.first.id;
    // print(_id);
    return val.doc(_id).update({
      'paymentMode': map["paymentMode"],
      'paymentIcon': map["paymentIcon"],
    }).then((value) {
      print('payment mode update sucessful');
    });
  }
}
