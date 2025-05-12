import 'package:e_com_flutter/Grocery-App-UI/Model/products.dart';
import 'package:e_com_flutter/food_reciept/utils.dart';
import 'package:flutter/material.dart';

class ProductItemDisplay extends StatefulWidget {
  const ProductItemDisplay({super.key, required this.grocery});

  final Grocery grocery;

  @override
  State<ProductItemDisplay> createState() => _ProductItemDisplayState();
}

class _ProductItemDisplayState extends State<ProductItemDisplay> {

  @override
  Widget build(BuildContext context) {
    final grocery = widget.grocery;
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 30,
                          spreadRadius: 15,
                          color: widget.grocery.color.withOpacity(0.2),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    grocery.image,
                    height: 160,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grocery.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          grocery.category,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black26,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$${grocery.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 22,
                              color: textGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        color: Colors.orange[900]
                      ),
                      child: Icon(Icons.shopping_bag_rounded,color: Colors.white,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
