import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/footboll_live_score/screens/match_details_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LiveMatchDetail extends StatelessWidget {
  final MatchDetailsScreen widget;
  const LiveMatchDetail({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: 20,
      right: 20,
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.liveMatch.color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -230,
              child: Transform.rotate(
                angle: 45,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    "assets/football/cl.png",
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    widget.liveMatch.stadium,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: widget.liveMatch.textColors),
                  ),
                  25.h,
                  Row(
                    children: [
                      Image.asset(
                        widget.liveMatch.homeLogo,
                        width: 90,
                        height: 90,
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffFFF4E5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: kprimaryColor,
                                  size: 10,
                                ),
                                5.w,
                                Text(
                                  "Live",
                                  style: TextStyle(
                                      color: kprimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          10.h,
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.liveMatch.homeGoal
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 36,
                                      color:
                                      widget.liveMatch.onTheWinner
                                          ? kprimaryColor
                                          : widget.liveMatch
                                          .textColors),
                                ),
                                TextSpan(
                                  text:
                                  " : ${widget.liveMatch.awayGoal}",
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: widget
                                          .liveMatch.onTheWinner
                                          ? widget.liveMatch.textColors
                                          : kprimaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        widget.liveMatch.awayLogo,
                        height: 90,
                        width: 90,
                      )
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 20,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 15,
                          decoration:
                          BoxDecoration(color: Colors.white),
                        ),
                        Positioned(
                          right: 50,
                          left: 0,
                          top: 0,
                          bottom: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kprimaryColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "ST",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: MediaQuery.of(context).size.width / 2 -
                              MediaQuery.of(context).size.width / 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              "HT",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -1,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text(
                              "FT",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
