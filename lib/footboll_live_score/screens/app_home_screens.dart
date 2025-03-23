import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/footboll_live_score/Model/up_coming_model.dart';
import 'package:e_com_flutter/footboll_live_score/constants.dart';
import 'package:e_com_flutter/footboll_live_score/screens/match_details_screen.dart';
import 'package:e_com_flutter/footboll_live_score/screens/up_coming_matches.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../Model/live_match_model.dart';
import '../widgets/live_match.dart';

class AppHomeScreens extends StatefulWidget {
  const AppHomeScreens({super.key});

  @override
  State<AppHomeScreens> createState() => _AppHomeScreensState();
}

class _AppHomeScreensState extends State<AppHomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerParts(),
      body: Column(
        children: [
          liveMatchText(),
          SizedBox(
            height: 230,
            child: ListView.builder(
              itemCount: liveMatches.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final live = liveMatches[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MatchDetailsScreen(liveMatch: live),
                      ),
                    );
                  },
                  child: LiveMatchData(live: live),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Up-Coming Matches",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.5,
                      color: Colors.black54),
                ),
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: kprimaryColor),
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: upcomingMatches.length,
                  itemBuilder: (context, index) {
                    final upMatch = upcomingMatches[index];
                    return UpComingMatches(upMatch: upMatch);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        20.h,
        Padding(
          padding: EdgeInsets.all(5),
          child: Material(
            elevation: 0.2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Iconsax.category),
            ),
          ),
        ),
        Spacer(),
        Row(
          children: [
            Text(
              "s",
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: -2),
            ),
            Icon(
              Icons.sports_soccer,
              color: kprimaryColor,
              size: 25,
            ),
            Text(
              "ccer",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: -2),
            ),
            Text(
              " Nerds",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: -2,
                  color: kprimaryColor),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(5),
          child: Material(
            elevation: 0.9,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Stack(
                children: [
                  Positioned(
                    right: 3,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: kprimaryColor,
                    ),
                  ),
                  Icon(Iconsax.notification),
                ],
              ),
            ),
          ),
        ),
        20.h,
      ],
    );
  }

  Padding liveMatchText() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            "Live Match",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Colors.black54,
                letterSpacing: -1.5),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.08), blurRadius: 20),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/football/pl.png",
                  width: 30,
                  height: 30,
                ),
                3.w,
                Text(
                  "Premier League",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.black),
                ),
                5.w,
                Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
          )
        ],
      ),
    );
  }

// Container liveMatchData({required LiveMatch live}) {
//   return Container(
//     height: 230,
//     margin: EdgeInsets.only(right: 20),
//     padding:
//     EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//     decoration: BoxDecoration(
//         color: live.color,
//         borderRadius: BorderRadius.circular(35),
//         image: live.backgroundImage),
//     child: Column(
//       children: [
//         Text(
//           live.stadium,
//           style: TextStyle(
//               fontSize: 16,
//               color: live.textColors,
//               letterSpacing: -1,
//               fontWeight: FontWeight.w600),
//         ),
//         Text(
//           "Week 13",
//           style: TextStyle(
//               fontSize: 11,
//               color: live.textColors,
//               letterSpacing: -1),
//         ),
//         10.h,
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               children: [
//                 Image.asset(
//                   live.homeLogo,
//                   height: 90,
//                   width: 90,
//                 ),
//                 10.h,
//                 Text(
//                   live.homeTitle,
//                   style: TextStyle(
//                       color: live.textColors,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: -1),
//                 ),
//                 Text(
//                   "Home",
//                   style: TextStyle(
//                       fontSize: 13,
//                       color: live.textColors,
//                       letterSpacing: -1),
//                 ),
//               ],
//             ),
//             20.w,
//             Column(
//               children: [
//                 5.h,
//                 Text(
//                   "${live.time}'",
//                   style: TextStyle(
//                       fontSize: 14, color: live.textColors),
//                 ),
//                 5.h,
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "${live.homeGoal} : ",
//                         style: TextStyle(
//                             fontSize: 36,
//                             color: live.onTheWinner
//                                 ? kprimaryColor
//                                 : live.textColors),
//                       ),
//                       TextSpan(
//                         text: live.awayGoal.toString(),
//                         style: TextStyle(
//                             fontSize: 36,
//                             color: live.onTheWinner
//                                 ? live.textColors
//                                 : kprimaryColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             20.w,
//             Column(
//               children: [
//                 Image.asset(
//                   live.awayLogo,
//                   height: 90,
//                   width: 90,
//                 ),
//                 10.h,
//                 Text(
//                   live.awayTitle.toUpperCase(),
//                   style: TextStyle(
//                       color: live.textColors,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: -1),
//                 ),
//                 Text(
//                   "Away",
//                   style: TextStyle(
//                       fontSize: 13,
//                       color: live.textColors,
//                       letterSpacing: -1),
//                 )
//               ],
//             )
//           ],
//         )
//       ],
//     ),
//   );
// }
}
