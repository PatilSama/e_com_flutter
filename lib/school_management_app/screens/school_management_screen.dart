import 'package:e_com_flutter/school_management_app/colors.dart';
import 'package:e_com_flutter/school_management_app/screens/app_home_page.dart';
import 'package:e_com_flutter/school_management_app/screens/calendar.dart';
import 'package:flutter/material.dart';

class SchoolManagementScreen extends StatefulWidget {
  const SchoolManagementScreen({super.key});

  @override
  State<SchoolManagementScreen> createState() => _SchoolManagementScreenState();
}

class _SchoolManagementScreenState extends State<SchoolManagementScreen> {
  int selectedIndex = 0;

  final List pages = [AppHomePage(),Scaffold(body: Container(color: Colors.grey,),),Scaffold(),Calendar(),Scaffold()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ""),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        backgroundColor: kBackground,
      ),
      body: pages[selectedIndex],
    );
  }
}
