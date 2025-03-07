import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/food_reciept/models/categories_recipe.dart';
import 'package:e_com_flutter/food_reciept/models/ingredients.dart';
import 'package:e_com_flutter/food_reciept/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ItemDetailsScreen extends StatefulWidget {
  final RecipeItems recipeItems;

  const ItemDetailsScreen({super.key, required this.recipeItems});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: _size.height,
        child: Stack(
          children: [
            Container(
              height: _size.height * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.recipeItems.image),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: _size.height * 0.5,
                width: _size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      50.h,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                NetworkImage(widget.recipeItems.woner),
                          ),
                          10.w,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.recipeItems.wonerName,
                                  maxLines: 1,
                                  style: TextStyle(
                                      height: 0,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                5.h,
                                Text(
                                  "12 Recipes Shared",
                                  style: TextStyle(
                                      height: 0,
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${widget.recipeItems.rate}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  5.w,
                                  RatingBar.builder(
                                    itemSize: 15,
                                    initialRating: widget.recipeItems.rate,
                                    unratedColor: Colors.grey.shade400,
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                      );
                                    },
                                    onRatingUpdate: (value) {
                                      print("Rating Update = $value");
                                    },
                                  ),
                                ],
                              ),
                              5.h,
                              Text(
                                "${widget.recipeItems.reviews} Reviews",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.6)),
                              )
                            ],
                          ),
                        ],
                      ),
                      30.h,
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.recipeItems.name,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              2.h,
                              Text(
                                "1 Bowl(${widget.recipeItems.weight}g)",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black45),
                              )
                            ],
                          ),
                          Spacer(),
                          Text(
                            "See details",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      30.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyProgressIndicatorValue(
                              name: "Carbs",
                              amount: "${widget.recipeItems.carb}g",
                              percentage: "(56%)",
                              color: Colors.green,
                              data: 0.4),
                          MyProgressIndicatorValue(
                              name: "Fat",
                              amount: "${widget.recipeItems.carb}g",
                              percentage: "(72%)",
                              color: Colors.red,
                              data: 0.6),
                          MyProgressIndicatorValue(
                              name: "Protein",
                              amount: "${widget.recipeItems.carb}g",
                              percentage: "(8%)",
                              color: Colors.orange,
                              data: 0.2),
                          MyProgressIndicatorValue(
                              name: "Calories",
                              amount: "${widget.recipeItems.carb}kkal",
                              percentage: "",
                              color: Colors.green,
                              data: 0.7)
                        ],
                      ),
                      25.h,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ingredients",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      10.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          ingredients.length,
                          (index) => Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: ingredients[index].color,
                                radius: 25,
                                child: Image.asset(
                                  ingredients[index].image,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              5.h,
                              Text(
                                ingredients[index].name,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: _size.height * 0.5,
              child: ClipPath(
                clipper: MyCliper(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 30,
              bottom: _size.height * 0.48,
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, spreadRadius: 7),
                  ],
                  color: widget.recipeItems.fav ? Colors.red : Colors.black45,
                ),
                child: Icon(
                  Iconsax.heart,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProgressIndicatorValue extends StatelessWidget {
  final String? name, amount;
  final String percentage;
  final Color color;
  final double data;

  const MyProgressIndicatorValue(
      {super.key,
      this.name,
      this.amount,
      required this.percentage,
      required this.color,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20,
      circularStrokeCap: CircularStrokeCap.round,
      percent: data,
      lineWidth: 7,
      reverse: true,
      animationDuration: 500,
      restartAnimation: true,
      progressColor: color,
      header: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Text(
          name!,
          style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
        ),
      ),
      footer: Padding(
        padding: EdgeInsets.only(top: 5),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$amount',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              TextSpan(
                text: percentage,
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
