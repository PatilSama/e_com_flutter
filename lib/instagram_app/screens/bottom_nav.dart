import 'package:e_com_flutter/instagram_app/bottom/heart_screen.dart';
import 'package:e_com_flutter/instagram_app/bottom/home_screen.dart';
import 'package:e_com_flutter/instagram_app/bottom/post_screen.dart';
import 'package:e_com_flutter/instagram_app/bottom/profile_screen.dart';
import 'package:e_com_flutter/instagram_app/bottom/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    PostScreen(),
    HeartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon:
              Icon(Icons.search),
              label: "Search"),
          BottomNavigationBarItem(
              icon:
              Icon(CupertinoIcons.plus_app),
              label: "Post"),
          BottomNavigationBarItem(
              icon:
              Icon(CupertinoIcons.heart),
              label: "Heart"),
          BottomNavigationBarItem(
              icon:
                 Icon(CupertinoIcons.profile_circled),
              label: "Profile"),
        ],
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        children: pages,
        index: currentIndex,
      ),
    );
  }
}
