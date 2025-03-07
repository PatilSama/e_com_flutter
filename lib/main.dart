import 'package:e_com_flutter/food_reciept/Views/recipe_on_boarding_screen.dart';
import 'package:e_com_flutter/footboll_live_score/app_main_screen.dart';
import 'package:flutter/material.dart';

import 'food_reciept/Views/home_screen_recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:RecipeOnBoardingScreen(),
      home: AppMainScreen(),
    );
  }
}
