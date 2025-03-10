import 'package:e_com_flutter/footboll_live_score/constants.dart';
import 'package:e_com_flutter/footboll_live_score/screens/app_home_screens.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    AppHomeScreens(),
    Scaffold( body: Expanded(child: Container(color: Colors.white,)),),
    Scaffold( body: Expanded(child: Container(color: Colors.yellow,)),),
    Scaffold( body: Expanded(child: Container(color: Colors.grey,)),),
  ];
  final titles = ["Home", "Calendar", "Standing", "Account"];
  final icons = [
    Iconsax.home,
    Iconsax.calendar_1,
    Iconsax.chart,
    Icons.person_outline
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.015),
                blurRadius: 8,
                spreadRadius: 5),
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => MyBottomNavBarItem(
                title: titles[index],
                isActive: currentTab == index,
                onTab: () => setState(() => currentTab = index),
                icon: icons[index]),
          ),
        ),
      ),
      body: screens[currentTab],
    );
  }
}

class MyBottomNavBarItem extends StatelessWidget {
  const MyBottomNavBarItem(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onTab,
      required this.icon});

  final String title;
  final bool isActive;
  final Function() onTab;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? kprimaryColor : Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey.shade400,
            ),
            if (isActive)
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
          ],
        ),
      ),
    );
  }
}
