import 'package:e_com_flutter/Grocery-App-UI/widgets/bottom_nav_bar.dart';
import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/food_reciept/utils.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class GroceryOnBoard extends StatefulWidget {
  const GroceryOnBoard({super.key});

  @override
  State<GroceryOnBoard> createState() => _GroceryOnBoardState();
}

class _GroceryOnBoardState extends State<GroceryOnBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: ClipPathOnBoard(),
            child: Container(
              width: size.width,
              height: size.height * 0.6,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 45,
                ),
                child: Image.asset(
                  "assets/grocery/onboarding_profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Column(
              children: [
                20.h,
                Text(
                  "Buy Groceries\nEasily With US",
                  style: TextStyle(
                      fontSize: 40, height: 1.3, fontWeight: FontWeight.w900),
                ),
                20.h,
                Text(
                  "Listen Podcast and open your \nworld with this application",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey),
                ),
                20.h,
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: gradientColor2,
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathOnBoard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 70, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
