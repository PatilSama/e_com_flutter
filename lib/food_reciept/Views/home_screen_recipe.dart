import 'package:e_com_flutter/food_reciept/color/colors.dart';
import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/food_reciept/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenRecipe extends StatefulWidget {
  const HomeScreenRecipe({super.key});

  @override
  State<HomeScreenRecipe> createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Column(
        children: [
          headerParts(),
          30.h,
          mySearchField(),
          40.h,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Menus",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.green),
                )
              ],
            ),
          ),
          20.h,
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: List.generate(
          //       menuItems.length,
          //       (index) => Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 10),
          //         child: GestureDetector(
          //           onTap: () {
          //             selectedIndex = index;
          //             setState(() {
          //
          //             });
          //           },
          //           child: Container(
          //             padding:
          //                 EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               gradient: LinearGradient(
          //                 colors: [
          //                   selectedIndex == index
          //                       ? Colors.green
          //                       : Colors.white,
          //                   selectedIndex == index
          //                       ? Colors.greenAccent
          //                       : Colors.white
          //                 ],
          //               ),
          //             ),
          //             child: Text(
          //               menuItems[index],
          //               style: TextStyle(
          //                   fontSize: 15,
          //                   fontWeight: selectedIndex == index
          //                       ? FontWeight.bold
          //                       : FontWeight.w500,
          //                   color: selectedIndex == index
          //                       ? Colors.white
          //                       : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )

          popularMenuItems(),
          20.h,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                recipeItems.length,
                (index) {
                  final recipe = recipeItems[index];
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 20, right: 10)
                        : EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 260,
                        width: _size.width / 2.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(image: AssetImage(recipe.image),fit: BoxFit.cover)),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Samadhan patil\n",
                  style: TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: "What do you want to eat today?",
                  style: TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ],
            ),
          ),
          Spacer(),
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://as2.ftcdn.net/v2/jpg/10/23/03/19/1000_F_1023031906_RjMct95KwZcrImTOqgB1NIAEQjnLPWw1.jpg"),
              ),
              Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: Colors.green),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Padding mySearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: searchBarColor),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Iconsax.search_normal,
                color: Colors.black45,
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.black26),
              contentPadding: EdgeInsets.symmetric(vertical: 15)),
        ),
      ),
    );
  }

  SingleChildScrollView popularMenuItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(menuItems.length, (index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      selectedIndex == index ? Colors.green : Colors.white,
                      selectedIndex == index ? Colors.greenAccent : Colors.white
                    ],
                  ),
                ),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.w500,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
