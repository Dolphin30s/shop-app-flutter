// ignore_for_file: invalid_return_type_for_catch_error, avoid_print


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_cart/models/order_model.dart';
import 'package:open_cart/providers/_mixins.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_provider.dart';

class OrderProvider extends BaseProvider with MixinProgressProvider {
  List<OrderModel> _orderDetails = <OrderModel>[];

  List<OrderModel> get orderDetails => _orderDetails;

  set orderDetails(List<OrderModel> orderDetails) {
    _orderDetails = orderDetails;
    notifyListeners();
  }

  // Future<OrderModel?> fetchOrderDetails() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userId = prefs.getString('userId');
  //   print(userId);

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("test")
  //         .where('userId', isEqualTo: userId)
  //         .get()
  //         .then((value) async {
  //       _orderDetails =
  //           value.docs.map((doc) => OrderModel.fromMap(doc.data())).toList();
  //       print(orderDetails.first);
  //     }).catchError((err) => print(err));
  //   } catch (ex) {
  //     print(ex.toString());
  //   } finally {}
  // }

  Future<OrderModel?> fetchOrderDetails() async {
    isLoading = true;

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    try {
      await FirebaseFirestore.instance
          .collection("test")
          .where('userId', isEqualTo: userId)
          .get()
          .then((value) async {
        _orderDetails = value.docs
            .map(
              (doc) => OrderModel.fromMap(
                doc.data(),
              ),
            )
            .toList();
      }).catchError((err) => print(err));
    } catch (ex) {
      print(ex.toString());
    } finally {
      isLoading = false;
    }
  }

  // Future<OrderModel?> fetchOrderDetails() async {
  //   isLoading = true;
  //   final prefs = await SharedPreferences.getInstance();
  //   final userId = prefs.getString('userId');
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("test")
  //         .where('userId', isEqualTo: userId)
  //         .get()
  //         .then((value) {
  //       _orderDetails = value.docs
  //           .map(
  //             (doc) => OrderModel.fromMap(
  //               doc.data(),
  //             ),
  //           )
  //           .toList();
  //     }).catchError((err) => print(err));
  //   } catch (ex) {
  //     print(ex.toString());
  //   } finally {
  //     isLoading = false;
  //   }
  // }

  Future<void> updateOrderCartValue({required list}) async {
    final val = FirebaseFirestore.instance.collection("test");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final userVal = await FirebaseFirestore.instance
        .collection("cart")
        .where('userId', isEqualTo: userId)
        .get();
    final String _id = userVal.docs.first.id;
    return val.doc(_id).update({
      'products': list,
    }).then((value) {
      print('sucessful');
    });
  }

  Future<void> addToCartValue({required list}) async {
    final val = FirebaseFirestore.instance.collection("test");

    return val.add({
      'products': list,
    }).then((value) {
      print('sucessful');
    });
  }

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
