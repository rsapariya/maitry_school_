import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/units/string.dart';

import '../../../../units/cusomewidget.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: SizedBox(
                        child: Container(
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins Medium",
                          fontSize: 18),
                    ),
                    InkWell(
                      child: SizedBox(
                        child: Container(
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: Get.height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                          image: AssetImage('asstes/image/Rectangle 5879.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  CustomStrings.about,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "popins"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  CustomStrings.about2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "popins"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  CustomStrings.about3,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "popins"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  CustomStrings.about4,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "popins"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  CustomStrings.about5,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "popins"),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
