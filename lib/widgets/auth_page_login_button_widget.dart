// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:open_cart/providers/auth_provider.dart';
import 'package:open_cart/screens/home_page_screen.dart';
import 'package:open_cart/screens/register_screen.dart';
import 'package:open_cart/utils/colors.dart';
import 'package:open_cart/utils/constants.dart';
import 'package:open_cart/utils/styles.dart';
import 'package:open_cart/utils/urls.dart';
import 'package:provider/provider.dart';

class LoginButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButtonWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    void _showErrorDialog(String message) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(message),
                titleTextStyle: tsCBlackFFPrimaryS25,
                content: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Dont have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterScreen.route);
                          },
                          child: const Text('SignUp'),
                        ),
                      ],
                    ),
                    Image.network(
                      burgerAvatarUrl,
                      width: 100,
                    ),
                  ],
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: colorOrangeCustom,
                          shape: RoundedRectangleBorder(borderRadius: bRC10)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Retry'),
                    ),
                  ),
                ],
              ));
    }

    void _showSucessDialog(String message) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Welcome to BurgerSpot!'),
                titleTextStyle: tsCBlackFFPrimaryS25,
                content: Text(message),
                actions: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: colorOrangeCustom,
                          shape: RoundedRectangleBorder(borderRadius: bRC20)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Okay'),
                    ),
                  ),
                ],
              ));
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: colorOrangeCustom,
          fixedSize: const Size(150, 50),
          shape: RoundedRectangleBorder(borderRadius: bRC20)),
      onPressed: () async {
        final String email = emailController.text;
        final String password = passwordController.text;

        try {
          if (formKey.currentState!.validate()) {
            await Provider.of<AuthorizationProvider>(context, listen: false)
                .signin(email, password);

            Navigator.of(context).pushReplacementNamed(HomeScreen.route);
            _showSucessDialog('Lets make your first order!');
          }
        } on Error catch (error) {
          print(
              'try4################################################################################################');
          print('This is the error : ${error.toString()}');
          var errMessage = 'Unable to login at the moment 😢';
          if (error.toString().contains("INVALID_PASSWORD")) {
            var errMessage = 'Invalid Password!';
          } else if (error.toString().contains("EMAIL_NOT_FOUND")) {
            var errMessage = 'Invalid Email!';
          } else if (error.toString().contains("USER_DISABLED")) {
            var errMessage = 'Your Account has been disabled!';
          }
          print(
              'try5################################################################################################');
          _showErrorDialog(errMessage);
        }
        print(
            'try6################################################################################################');
        // emailController.clear();
        // passwordController.clear();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Login',
            style: tsCwhiteFFPrimaryS20,
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
