import 'package:e_com_flutter/instagram_app/screens/signup_screen.dart';
import 'package:e_com_flutter/instagram_app/widgets/ui_helper.dart';
import 'package:flutter/material.dart';

import 'bottom_nav.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customImage(
                imageUrl: "assets/instagram/Instagram_name.png"),
            SizedBox(
              height: 20,
            ),
            UiHelper.customTextField(
                controller: emailController, text: "email", toHide: false),
            SizedBox(
              height: 15,
            ),
            UiHelper.customTextField(
                controller: passwordController, text: "password", toHide: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: UiHelper.customTextButton(
                      text: "Forgot Password", callback: () {}),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            UiHelper.customButton(callback: () {    Navigator.push(context,
                MaterialPageRoute(builder: (_) => BottomNavScreen()));}, buttonName: "Log In"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customImage(imageUrl: "assets/instagram/Icon.png"),
                UiHelper.customTextButton(
                    text: "Log in with Facebook",
                    callback: () {

                    }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Don't Have an account",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                UiHelper.customTextButton(
                    text: "Sign Up",
                    callback: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
