import 'package:e_com_flutter/burger_app/screens/burger_items_details.dart';
import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:flutter/material.dart';

import '../models/butget_mode.dart';

class BurgerMainScreen extends StatefulWidget {
  const BurgerMainScreen({super.key});

  @override
  State<BurgerMainScreen> createState() => _BurgerMainScreenState();
}

class _BurgerMainScreenState extends State<BurgerMainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              // border: Border.all(width: 1,color: Colors.black),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(2, 3),
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.menu,
                                weight: 40,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 2,
                            top: 5,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.red),
                            color: Colors.orange.withOpacity(0.1),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://as2.ftcdn.net/v2/jpg/03/64/21/11/1000_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find and Order",
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          "Burger For You 🍔",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                searchBar(),
                40.h,
                categorySelection(),
                5.h,
                Text(
                  "Most Popular",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                15.h,
                Visibility(
                  visible: selectedIndex == 0 ? true : false,
                  child: SizedBox(
                    width: size.width,
                    height: 270,
                    child: ListView.builder(
                      itemCount: burgers.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final burger = burgers[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BurgerItemsDetails(burger: burger),),);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: size.width / 2,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7,
                                    offset: Offset(0, 5),
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {

                                      });
                                      burger.isFavorited = !burger.isFavorited;
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: burger.isFavorited
                                                ? Colors.pink.shade50
                                                : Colors.grey.shade200),
                                        child: Icon(
                                          Icons.favorite,
                                          color: burger.isFavorited
                                              ? Colors.red
                                              : Colors.black26,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Image.network(
                                        burger.image,
                                        height: 120,
                                      ),
                                      10.h,
                                      Text(
                                        burger.name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      10.h,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                            size: 20,
                                          ),
                                          Text(
                                            "${burger.rating} |",
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            burger.distance,
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      15.h,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "\$",
                                            style:
                                                TextStyle(color: Colors.orange),
                                          ),
                                          Text(
                                            "${burger.price}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Findy Your Burger",
          hintStyle: TextStyle(fontSize: 18, color: Colors.black38),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: categoryList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: Column(
                children: [
                  Container(
                    margin: index == 0
                        ? EdgeInsets.only(left: 20, right: 10)
                        : EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
