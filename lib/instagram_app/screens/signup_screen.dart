import 'package:e_com_flutter/instagram_app/screens/login_screen.dart';
import 'package:e_com_flutter/instagram_app/widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" SignUp Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customImage(
                imageUrl: "assets/instagram/Instagram_name.png"),
            SizedBox(
              height: 10,
            ),
            UiHelper.customTextField(
                controller: emailController,
                text: "Email",
                toHide: false,
                textInputType: TextInputType.emailAddress),
            SizedBox(
              height: 10,
            ),
            UiHelper.customTextField(
                controller: passwordController,
                text: "Password",
                toHide: true,
                textInputType: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            UiHelper.customTextField(
                controller: userNameController,
                text: "UserName",
                toHide: false,
                textInputType: TextInputType.name),
            SizedBox(
              height: 30,
            ),
            UiHelper.customButton(callback: () {}, buttonName: "Sign Up"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an Account?",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                UiHelper.customTextButton(
                    text: "Sign In",
                    callback: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
