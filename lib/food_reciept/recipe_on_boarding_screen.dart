
import 'package:e_com_flutter/food_reciept/Views/home_screen_recipe.dart';
import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/food_reciept/utils.dart';
import 'package:flutter/material.dart';

class RecipeOnBoardingScreen extends StatefulWidget {
  const RecipeOnBoardingScreen({super.key});

  @override
  State<RecipeOnBoardingScreen> createState() => _RecipeOnBoardingScreenState();
}

class _RecipeOnBoardingScreenState extends State<RecipeOnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.625,
              decoration: BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey.shade400,
                    Colors.grey.shade200,
                    Colors.white
                  ],
                ),
                image: DecorationImage(
                    image: AssetImage("assets/food_recipe/background_1.png"),
                    fit: BoxFit.cover),
              ),
            ),
            20.h,
            Container(
              height: size.height * 0.325,
              width: size.width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Let's cook your own food and adjust your diet.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1.3),
                    ),
                    Text(
                      "Don't be confused, Complete your nutritional needs by choosing food here!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.8,
                          color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreenRecipe()));
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: gradientColor),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
