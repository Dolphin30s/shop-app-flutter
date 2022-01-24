import 'package:open_cart/screens/add_address_screen.dart';
import 'package:open_cart/screens/add_new_address_screen.dart';
import 'package:open_cart/screens/cart_screen.dart';
import 'package:open_cart/screens/home_page_screen.dart';
import 'package:open_cart/screens/login_screen.dart';
import 'package:open_cart/screens/logout_screen.dart';
import 'package:open_cart/screens/my_account_screen.dart';
import 'package:open_cart/screens/order_preview_screen.dart';
import 'package:open_cart/screens/product_detail_screen.dart';
import 'package:open_cart/screens/products_screen.dart';
import 'package:open_cart/screens/register_screen.dart';
import 'package:open_cart/screens/splash_screen.dart';
import 'package:open_cart/test_screen.dart';

final routes = {
  OrderPreviewScreen.route: (context) => const OrderPreviewScreen(),
  SplashScreen.route: (context) => const SplashScreen(),
  CartScreen.route: (context) => const CartScreen(),
  BurgersScreen.route: (context) => const BurgersScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
  LoginScreen.route: (context) => LoginScreen(),
  LogoutScreen.route: (context) => const LogoutScreen(),
  RegisterScreen.route: (context) => const RegisterScreen(),
  AddressScreen.route: (context) => const AddressScreen(),
  AddNewAddressScreen.route: (context) => const AddNewAddressScreen(),
  ProductDetailScreen.route: (context) => const ProductDetailScreen(),
  MyAccountScreen.route: (context) => const MyAccountScreen(),
  TestScreen.route:(context)=> const TestScreen(),
};
