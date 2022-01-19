// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:open_cart/screens/cart_screen.dart';
import 'package:open_cart/utils/colors.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: colorOrangeCustom),
                  child: FloatingActionButton(
                      backgroundColor: colorFF,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: colorOrangeCustom,
                      ),
                      elevation: 0.1,
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.route);
                      }),
                ),
                // Positioned(
                //   top: 0,
                //   left: 30,
                //   child: Consumer<CartProvider>(
                //     builder: (context, value, child) {
                //       return Container(
                //         padding: EdgeInsets.all(2),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           color: Colors.red,
                //         ),
                //         child: Text(value.getCounter().toString(),
                //             style: TextStyle(color: Colors.white)),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          TabBar(
              automaticIndicatorColorAdjustment: false,
              unselectedLabelColor: colorBlueGreyCustom,
              indicatorColor: Colors.transparent,
              tabs: const [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.store),
                  text: 'Burgers',
                ),
                Tab(
                  child: SizedBox(
                    width: 100,
                  ),
                ),
                Tab(
                  icon: Icon(Icons.favorite_border),
                  text: 'Favs',
                ),
                Tab(
                  icon: Icon(Icons.more),
                  text: 'More',
                ),
              ]),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = colorOrangeCustom;

    Path path = Path();
    path.moveTo(0, 30); // Start
    path.quadraticBezierTo(0, 0, size.width * 0.3, 0);
    path.lineTo(size.width * 0.1, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.8, 0);
    path.lineTo(size.width * 0.7, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
