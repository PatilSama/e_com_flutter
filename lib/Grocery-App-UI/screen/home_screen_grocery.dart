import 'package:e_com_flutter/Grocery-App-UI/Utils/constants.dart';
import 'package:e_com_flutter/Grocery-App-UI/screen/product_item_desplay.dart';
import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/products.dart';

class HomeScreenGrocery extends StatefulWidget {
  const HomeScreenGrocery({super.key});

  @override
  State<HomeScreenGrocery> createState() => _HomeScreenGroceryState();
}

class _HomeScreenGroceryState extends State<HomeScreenGrocery> {
  String categories = 'ALL';
  List<Grocery> grocery = groceryItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerParts(),
            30.h,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 65,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Search Grocery",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.w,
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[50],
                    ),
                    child: Icon(
                      Icons.tune_rounded,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            20.h,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  groceryCategories.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        categories = groceryCategories[index];
                        categories == "ALL"
                            ? grocery = groceryItems
                            : grocery = groceryItems
                                .where((element) =>
                                    element.category.toLowerCase() ==
                                    categories.toLowerCase())
                                .toList();
                        // Fluttertoast.showToast(
                        //     msg: categories,
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.CENTER,
                        //     backgroundColor: Colors.red,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0
                        // );
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: Column(
                        children: [
                          Text(
                            groceryCategories[index],
                            style: TextStyle(
                                fontSize: categories == groceryCategories[index]?18:16,
                                color:categories == groceryCategories[index]? textGreen:Colors.black26,
                                fontWeight: categories == groceryCategories[index]?FontWeight.w900:FontWeight.w600),
                          ),
                         categories ==   groceryCategories[index]
                              ? CircleAvatar(
                                  radius: 4,
                                  backgroundColor: textGreen,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: List.generate(
                    grocery.length,
                    (index) => GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: ProductItemDisplay(
                          grocery: groceryItems[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Welcome\n",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                TextSpan(
                  text: "Samadhan Patil",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      height: 1.5),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
                image: DecorationImage(image: NetworkImage(""))),
          ),
        ],
      ),
    );
  }
}
