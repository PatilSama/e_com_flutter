import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/footboll_live_score/Model/up_coming_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class UpComingMatches extends StatelessWidget {
  const UpComingMatches({super.key, required this.upMatch});

  final UpcomingMatch upMatch;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -5),
                    color: upMatch.isFavorite
                        ? kprimaryColor
                        : Colors.black12),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  upMatch.homeTitle,
                  style: TextStyle(
                      fontSize: 16.5,
                      letterSpacing: -1,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(
                      upMatch.homeLogo,
                      width: 45,
                      height: 45,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 11, letterSpacing: -1),
                    )
                  ],
                ),
                10.w,
                Column(
                  children: [
                    Text(
                      upMatch.time,
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: -1,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      upMatch.date,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                10.w,
                Column(
                  children: [
                    Image.asset(
                      upMatch.awayLogo,
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      upMatch.awayTitle,
                      style: TextStyle(
                          fontSize: 11, letterSpacing: -1),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  upMatch.awayTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16.5,
                      letterSpacing: -1,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: Icon(
              Icons.star,
              color: upMatch.isFavorite
                  ? kprimaryColor
                  : Colors.white,
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
