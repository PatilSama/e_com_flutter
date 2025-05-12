import 'package:e_com_flutter/API_Call/example_tree.dart';
import 'package:e_com_flutter/API_Call/example_two.dart';
import 'package:e_com_flutter/API_Call/signup.dart';
import 'package:e_com_flutter/API_Call/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'API_Call/home_screen.dart';
import 'covid_19/views/splash_screen.dart';
import 'todo app/home_page.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // // home:RecipeOnBoardingScreen(),
      // home: HomeScreenGrocery(),
      // title: "Notes App",
      // theme: ThemeData(primarySwatch: Colors.deepPurple,
      // visualDensity: VisualDensity.adaptivePlatformDensity),
      // home: MemeHomePage(),

      // title: "Dice App",
      // theme: ThemeData(primarySwatch: Colors.deepPurple),
      // home: MyHomePage(),
      title: "Instagram",
      // theme: ThemeData(primarySwatch: Colors.deepPurple),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),

      home: SplashScreen(),
    );
  }
}
