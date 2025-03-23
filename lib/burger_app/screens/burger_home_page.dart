import 'package:e_com_flutter/burger_app/screens/burger_main_screen.dart';
import 'package:flutter/material.dart';

class BurgerHomePage extends StatefulWidget {
  const BurgerHomePage({super.key});

  @override
  State<BurgerHomePage> createState() => _BurgerHomePageState();
}

class _BurgerHomePageState extends State<BurgerHomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    BurgerMainScreen(),
   Scaffold(
      body: Center(
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 100,
          color: Colors.black,
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Icon(
          Icons.favorite_border,
          size: 100,
          color: Colors.black,
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Icon(
          Icons.note_add_outlined,
          size: 100,
          color: Colors.black,
        ),
      ),
    ),
  ];



  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_add_outlined), label: ""),
        ],
        backgroundColor: Colors.white,
        iconSize: 33,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {});
          selectedIndex = value;
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: pages[selectedIndex],
    );
  }
}
