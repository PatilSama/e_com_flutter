import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/footboll_live_score/Model/live_match_model.dart';
import 'package:e_com_flutter/footboll_live_score/constants.dart';

import 'package:e_com_flutter/footboll_live_score/widgets/live_match_stats.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Live_match_detail.dart';

class MatchDetailsScreen extends StatefulWidget {
  LiveMatch liveMatch;

  MatchDetailsScreen({super.key, required this.liveMatch});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  List<Map<String, dynamic>> tabs = [
    {"label": "Stats"},
    {"label": "H2H"},
    {"label": "Table"}
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailBackground,
      appBar: headerParts(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              padding: EdgeInsets.only(top: 180, right: 20, left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      tabs.length,
                      (index) {
                        final tab = tabs[index];
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: selectedIndex == index
                                  ? kprimaryColor
                                  : detailBackground),
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            tab["label"],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  20.h,
                  LiveMatchStats(
                      homeStats: widget.liveMatch.shotOnTarget,
                      awayStats: widget.liveMatch.shotOnTarget * 2,
                      title: "Shots On Target",
                      homeValue: widget.liveMatch.shotOnTarget.toDouble() / 10,
                      awayValue:
                          widget.liveMatch.shotOnTarget.toDouble() * 2 / 10,
                      isHomeWinner: false)
                ],
              ),
            ),
            LiveMatchDetail(widget: widget),
          ],
        ),
      ),
    );
  }

  headerParts(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: detailBackground,
      actions: [
        20.w,
        Padding(
          padding: EdgeInsets.all(5),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Iconsax.arrow_square_left)),
            ),
          ),
        ),
        Spacer(),
        Column(
          children: [
            Text(
              "Champions League",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -1),
            ),
            Text(
              "GROUP STAGE",
              style: TextStyle(
                  fontSize: 14, color: Colors.grey, letterSpacing: -1),
            )
          ],
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(5),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Iconsax.more_square),
            ),
          ),
        ),
        20.w,
      ],
    );
  }
}
