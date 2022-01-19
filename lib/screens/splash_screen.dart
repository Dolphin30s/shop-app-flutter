import 'package:flutter/material.dart';
import 'package:open_cart/screens/login_screen.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() => _initAsync());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorDarkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'BS',
                style: tsCOrangeCustomFFPrimaryS100,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: SizedBox(
                width: 100,
                child: LinearProgressIndicator(
                  color: colorOrangeCustom,
                  backgroundColor: colorDarkGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _initAsync() async {
    await Future.delayed(const Duration(seconds: 5));
    await Navigator.of(context).pushReplacementNamed(LoginScreen.route);
  }
}
