import 'package:e_com_flutter/food_reciept/extentions/sized_box_extension.dart';
import 'package:e_com_flutter/school_management_app/colors.dart';
import 'package:flutter/material.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kheaderColor,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: "Wed",
                      style: TextStyle(
                        color: textColor,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w900,
                      ),
                      children: [
                        TextSpan(
                          text: "10 Oct",
                          style: TextStyle(
                              letterSpacing: -1,
                              color: textColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                15.h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 7,
                            spreadRadius: 7,
                            offset: Offset(0, 5),
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://www.alucoildesign.com/assets/pages/media/profile/profile.jpg"),
                        ),
                      ),
                    ),
                    20.w,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi Jackie",
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.5,
                              color: textColor),
                        ),
                        5.h,
                        Text(
                          "Here is a list of schedule\nyou need to check...",
                          style: TextStyle(
                              height: 1.8, color: textColor.withOpacity(0.75)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 220,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height - 230,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView(
              children: [
                seeAllItems("TODAY CLASSED", 3),
                20.h,
                todayClassesItems(
                    "07:05",
                    "The Basic Of Typography II",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&s",
                    "Gabriel Sutton"),
                todayClassesItems(
                    "09:30",
                    "Design Psychology : Principle of Arts|",
                    "https://media.istockphoto.com/id/1154642632/photo/close-up-portrait-of-brunette-woman.jpg?s=612x612&w=0&k=20&c=d8W_C2D-2rXlnkyl8EirpHGf-GpM62gBjpDoNryy98U=",
                    "Jessie Reeves"),
                20.h,
                seeAllItems("YOUR TASKS", 4),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      yourTaskItems(color:Colors.red,dayLeft: 3,courseTitle: "The Basic Of Typography II"),
                      yourTaskItems(color:Colors.green,dayLeft: 10,courseTitle: "Design Psychology:Principle of good design"),
                      yourTaskItems(color:Colors.red,dayLeft: 10,courseTitle: "Design Psychology:Principle of Arts."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container todayClassesItems(time, title, profile, name) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 110,
      decoration: BoxDecoration(
        color: kcardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(
                "AM",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 20,
                    ),
                    5.w,
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Text(
                        "Room C1, Faculty of  art & Design Building",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(profile),
                      radius: 12,
                    ),
                    5.w,
                    Text(
                      name,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row seeAllItems(title, number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
            children: [
              TextSpan(
                text: "($number)",
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Text(
          "See All",
          style: TextStyle(fontWeight: FontWeight.bold, color: secondTextColor),
        ),
      ],
    );
  }

  Container yourTaskItems({Color color=Colors.black54, int dayLeft = 0, String courseTitle=""}) {
    return Container(
      margin: EdgeInsets.only(
        right: 15,
      ),
      padding: EdgeInsets.all(12),
      height: 170,
      width: 175,
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deadline",
            style: TextStyle(fontSize: 15, color: Colors.black26),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 4,
                backgroundColor: color,
              ),
              5.w,
              Text(
                "${dayLeft} days left",
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
            ],
          ),
          20.h,
          SizedBox(
            width: 130,
            child: Text(
              courseTitle,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
