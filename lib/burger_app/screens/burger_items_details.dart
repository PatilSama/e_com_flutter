import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:flutter/material.dart';

import '../models/butget_mode.dart';

class BurgerItemsDetails extends StatefulWidget {
  final Burger burger;

  const BurgerItemsDetails({super.key, required this.burger});

  @override
  State<BurgerItemsDetails> createState() => _BurgerItemsDetailsState();
}

class _BurgerItemsDetailsState extends State<BurgerItemsDetails> {
  int total = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            Text("\$"),Text("${widget.burger.price}",style: TextStyle(fontSize: 30, color: Colors.black),)
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      "Details",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                Center(
                  child: Image.network(
                    widget.burger.image,
                    height: 350,
                  ),
                ),
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Text(
                        widget.burger.rating.toString(),
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                15.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 220,
                      child: Text(
                        widget.burger.name,
                        style: TextStyle(
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ),
                    20.w,
                    Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (total < 1) {
                                setState(() {
                                  total = 1;
                                });
                              } else if (total > 1) {
                                setState(() {
                                  total -= 1;
                                });
                              }
                            },
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Text(
                            "$total",
                            style: TextStyle(fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {

                                setState(() {
                                  total += 1;
                                });
                            },
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                15.h,
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                10.h,
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ingredientsBox("", ""),
                      ingredientsBox("", ""),
                      ingredientsBox("", ""),
                      ingredientsBox("", ""),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding ingredientsBox(icon, name) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            10.h,
            Text(
              icon,
              style: TextStyle(fontSize: 25),
            ),
            5.h,
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
