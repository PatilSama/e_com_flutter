import 'package:e_com_flutter/food_reciept/Views/item_details_screen.dart';
import 'package:e_com_flutter/food_reciept/color/colors.dart';
import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/food_reciept/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/categories_recipe.dart';

class HomeScreenRecipe extends StatefulWidget {
  const HomeScreenRecipe({super.key});

  @override
  State<HomeScreenRecipe> createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
  int selectedIndex = 0;

  int selectedPage = 0;
  List<IconData> icons = [
    Iconsax.home1,
    Icons.bar_chart_rounded,
    Iconsax.heart,
    Icons.person_outline_rounded
  ];

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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.green),
                    ),
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
              categoryContain(_size),
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
              categoryItems(),
              Padding(
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://media.istockphoto.com/id/1213660289/photo/young-beautiful-chinese-chef-woman-wearing-cooker-uniform-and-hat-holding-tray-with-dome-with.jpg?s=612x612&w=0&k=20&c=Acr3SpWXvGhElDWXTo2Z7hfc7jpUQrXJuOs9SzuZEHA="),
                        ),
                      ),
                    ),
                    20.w,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hona Ci Minh",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                        Text(
                          "Expert Chef",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (index) {
            return GestureDetector(
              onTap: () {
                selectedPage = index;
                setState(() {});
              },
              child: SizedBox(
                width: 50,
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      color: index == selectedPage ? Colors.green : Colors.grey,
                      size: 28,
                    ),
                    index == selectedPage
                        ? Container(
                            height: 3,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            );
          }),
        ),
      ),
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
                ),
              ),
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

  SingleChildScrollView categoryContain(Size _size) {
    return SingleChildScrollView(
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ItemDetailsScreen(recipeItems: recipe),
                    ),
                  );
                },
                child: Container(
                  height: 260,
                  width: _size.width / 2.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(recipe.image), fit: BoxFit.cover),
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
                          color: recipe.fav ? Colors.red : Colors.black45,
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
                                          height: 0, color: Colors.white),
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
    );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recipeCategory.length,
          (index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.only(left: 20, right: 20)
                  : EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: recipeCategory[index].color,
                    child: Image.asset(
                      recipeCategory[index].image,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  5.h,
                  Text(
                    recipeCategory[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
