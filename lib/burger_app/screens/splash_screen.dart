import 'package:e_com_flutter/burger_app/screens/burger_home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Container(
                child: Image.network(
                    fit: BoxFit.cover,
                    "https://img.freepik.com/free-photo/double-cheeseburger_23-2151950841.jpg?t=st=1742480435~exp=1742484035~hmac=79ecc05b151c2b0b481dfd896dfce84dbb85bc114849d5a106eedf3994868f32&w=740"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Center(
                  child: Text(
                    "            👑",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Center(
                  child: Text(
                    "BURGER \nQUEEN",
                    style: TextStyle(
                        height: 0.9,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.47,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Food \nTasty Food *",
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 43,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 172, 109, 8),
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      GestureDetector(onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>BurgerHomePage(),),);
                      },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[800],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style:
                                TextStyle(fontSize: 17, color: Colors.white70),
                          ),
                          Text(
                            "Sing Up",
                            style: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
