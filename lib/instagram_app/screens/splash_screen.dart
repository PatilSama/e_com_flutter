import 'dart:async';

import 'package:e_com_flutter/instagram_app/screens/login_screen.dart';
import 'package:e_com_flutter/instagram_app/widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen(),),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customImage(
                imageUrl: "assets/instagram/instagram_logo.png"),
            SizedBox(
              height: 10,
            ),
            UiHelper.customImage(
                imageUrl: "assets/instagram/Instagram_name.png"),
          ],
        ),
      ),
    );
  }
}
