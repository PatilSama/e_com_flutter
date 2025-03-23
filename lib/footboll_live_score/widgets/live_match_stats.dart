import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/footboll_live_score/constants.dart';
import 'package:flutter/material.dart';

class LiveMatchStats extends StatelessWidget {
  final int homeStats, awayStats;
  final String title;
  final double homeValue, awayValue;
  final bool isHomeWinner;

  const LiveMatchStats(
      {super.key,
      required this.homeStats,
      required this.awayStats,
      required this.title,
      required this.homeValue,
      required this.awayValue,
      required this.isHomeWinner});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homeStats.toString(),
                style: TextStyle(
                    color: isHomeWinner ? kprimaryColor : ksecondaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    fontSize: 16),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                awayStats.toString(),
                style: TextStyle(
                    color: !isHomeWinner ? kprimaryColor : ksecondaryColor,
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          10.h,
          Row(
            children: [
              Expanded(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: LinearProgressIndicator(
                    value: homeValue,
                    minHeight: 10,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation(
                        isHomeWinner ? kprimaryColor : ksecondaryColor),
                  ),
                ),
              ),
              10.w,
              Expanded(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: LinearProgressIndicator(
                    value: awayValue,
                    minHeight: 10,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation(
                        !isHomeWinner ? kprimaryColor : ksecondaryColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
