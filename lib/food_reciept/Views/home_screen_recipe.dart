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
          child: SingleChildScrollView(
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
                            image: DecorationImage(
                                image: AssetImage(recipe.image),
                                fit: BoxFit.cover),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      recipe.fav ? Colors.red : Colors.black45,
                                ),
                                child: Icon(
                                  Iconsax.heart,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black45),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            recipe.name,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                height: 0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 18,
                                            ),
                                            Text(
                                              "${recipe.rate}",
                                              style: TextStyle(
                                                  height: 0,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    3.h,
                                    Text(
                                      "1 Bowl (${recipe.weight}g)",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                          height: 0),
                                    ),
                                    3.h,
                                    Text(
                                      "${recipe.calorie} Kkal | 25% AKI",
                                      style: TextStyle(color: Colors.white70),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
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
            40.h,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            10.h,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) {
                    return Padding(
                      padding:index == 0? EdgeInsets.only(left: 20,right: 10):EdgeInsets.only(right: 10),
                      child: Container(height: 100,width: 100,decoration: BoxDecoration(color: Colors.yellow),),
                    );
                  },
                ),
              ),
            )
          ],
        ),
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
