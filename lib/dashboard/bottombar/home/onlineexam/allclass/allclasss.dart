import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/dashboard/bottombar/bottombar.dart';
import 'package:schooolapp/dashboard/bottombar/home/pdf/selectchapter.dart';

import '../../../../../../units/cusomewidget.dart';

class allclass extends StatefulWidget {
  const allclass({Key? key}) : super(key: key);

  @override
  State<allclass> createState() => _allclassState();
}

class _allclassState extends State<allclass> {
  @override
  bool langauge = true;
  String student = "13";
  var totel = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: appButton(
      //     onTap: () {
      //       Get.to(() => selectchapter());
      //     },
      //     title: "Save and Continue"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                            "asstes/image/backwrrow.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Online Exam Result",
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
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          student = "11";
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.blue)),
                                child: student == "11"
                                    ? Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.blue,
                                        ),
                                      )
                                    : SizedBox()),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Date Wise",
                              style:
                                  TextStyle(fontFamily: "popins", fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          student = "22";
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.blue)),
                                child: student == "22"
                                    ? Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.blue,
                                        ),
                                      )
                                    : SizedBox()),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Student Wise",
                              style:
                                  TextStyle(fontFamily: "popins", fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    String? hintText,
    prifix,
    surfix,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: prifix,
      suffixIcon: surfix,
      hintText: hintText,
      hintStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
          width:1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
