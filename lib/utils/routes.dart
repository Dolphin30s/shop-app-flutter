

import 'package:open_cart/screens/add_address_screen.dart';
import 'package:open_cart/screens/cart_screen.dart';
import 'package:open_cart/screens/home_page_screen.dart';
import 'package:open_cart/screens/login_screen.dart';
import 'package:open_cart/screens/my_account_screen.dart';
import 'package:open_cart/screens/product_detail_screen.dart';
import 'package:open_cart/screens/products_screen.dart';
import 'package:open_cart/screens/register_screen.dart';
import 'package:open_cart/screens/splash_screen.dart';

final routes = {
  SplashScreen.route: (context) => const SplashScreen(),
  CartScreen.route: (context) => const CartScreen(),
  ProductsScreen.route: (context) => const ProductsScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  RegisterScreen.route: (context) => const RegisterScreen(),
  AddressScreen.route: (context) => const AddressScreen(),
  ProductDetailScreen.route: (context) => const ProductDetailScreen(),
  MyAccountScreen.route: (context) => const MyAccountScreen(),
};
