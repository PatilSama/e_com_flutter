import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:flutter/material.dart';

import '../Model/live_match_model.dart';
import '../constants.dart';

class LiveMatchData extends StatelessWidget {
  const LiveMatchData({super.key, required this.live});

  final LiveMatch live;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: live.color,
          borderRadius: BorderRadius.circular(35),
          image: live.backgroundImage),
      child: Column(
        children: [
          Text(
            live.stadium,
            style: TextStyle(
                fontSize: 16,
                color: live.textColors,
                letterSpacing: -1,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Week 13",
            style: TextStyle(
                fontSize: 11, color: live.textColors, letterSpacing: -1),
          ),
          10.h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    live.homeLogo,
                    height: 90,
                    width: 90,
                  ),
                  10.h,
                  Text(
                    live.homeTitle,
                    style: TextStyle(
                        color: live.textColors,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 13,
                        color: live.textColors,
                        letterSpacing: -1),
                  ),
                ],
              ),
              20.w,
              Column(
                children: [
                  5.h,
                  Text(
                    "${live.time}'",
                    style: TextStyle(fontSize: 14, color: live.textColors),
                  ),
                  5.h,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${live.homeGoal} : ",
                          style: TextStyle(
                              fontSize: 36,
                              color: live.onTheWinner
                                  ? kprimaryColor
                                  : live.textColors),
                        ),
                        TextSpan(
                          text: live.awayGoal.toString(),
                          style: TextStyle(
                              fontSize: 36,
                              color: live.onTheWinner
                                  ? live.textColors
                                  : kprimaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              20.w,
              Column(
                children: [
                  Image.asset(
                    live.awayLogo,
                    height: 90,
                    width: 90,
                  ),
                  10.h,
                  Text(
                    live.awayTitle.toUpperCase(),
                    style: TextStyle(
                        color: live.textColors,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1),
                  ),
                  Text(
                    "Away",
                    style: TextStyle(
                        fontSize: 13,
                        color: live.textColors,
                        letterSpacing: -1),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
