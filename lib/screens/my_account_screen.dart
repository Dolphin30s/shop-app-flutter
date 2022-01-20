import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  static const String route = '/myAccount';
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height / 2,
              width: deviceSize.width,
              child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/opencart-shop-94f38.appspot.com/o/people_images%2F1.jpg?alt=media&token=3aaa5232-20a8-4f8b-b08c-4bef597ba12c'),
            ),
            const Text('User Name'),
            const Text('User Name'),
            const Text('User Name'),
          ],
        ),
      ),
    );
  }
}
