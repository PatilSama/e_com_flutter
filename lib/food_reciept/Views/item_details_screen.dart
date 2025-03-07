import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/food_reciept/models/recipe_model.dart';
import 'package:flutter/material.dart';

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
                            children: [Text(widget.recipeItems.wonerName)],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
