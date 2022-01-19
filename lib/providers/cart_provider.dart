// ignore_for_file: invalid_return_type_for_catch_error, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_cart/models/cart_model.dart';
import 'package:open_cart/providers/_mixins.dart';
import 'package:open_cart/providers/base_provider.dart';
import 'package:open_cart/screens/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends BaseProvider with MixinProgressProvider {
  List<CartModel> _cartList = <CartModel>[];

  List<CartModel> get cartList => _cartList;

  set cartList(List<CartModel> val) {
    _cartList = val;
    notifyListeners();
  }

  Future<CartModel?> fetchProducts() async {
    isLoading = true;

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    // print(userId);
    try {
      await FirebaseFirestore.instance
          .collection("cart")
          .where('userId', isEqualTo: userId)
          .get()
          .then((value) async {
        _cartList = value.docs
            .map(
              (doc) => CartModel.fromMap(
                doc.data(),
              ),
            )
            .toList();
        // print(_cartList.length.toString());
      }).catchError((err) => print(err));
    } catch (ex) {
      print(ex.toString());
    } finally {
      isLoading = false;
    }
  }

  Future<void> addProductToCart(
      {cartId,
      productPrice,
      required productId,
      userId,
      required productImage}) async {
    final cart = FirebaseFirestore.instance.collection("cart");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    return cart.add({
      'cartId': cart.doc().id,
      'userId': userId,
      'productPrice': productPrice,
      'productName': productId,
      'productImage': productImage,
    }).then((value) {
      print('');
    });
  }

  Future<void> deleteProduct(index) async {
    final cart = await FirebaseFirestore.instance.collection("cart").get();
    String docId = (cart.docs.elementAt(index).id);
    return FirebaseFirestore.instance.collection("cart").doc(docId).delete();
  }
}
