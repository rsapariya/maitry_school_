import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:schooolapp/techers/dashboard/bottombar/home/onlineexam/view/viewexam.dart';

import '../../../../units/cusomewidget.dart';
import '../notification.dart';
import 'allclass/allclasss.dart';
import 'creatclass/createclass.dart';
import 'createexam/createxam.dart';

class online extends StatefulWidget {
  const online({Key? key}) : super(key: key);

  @override
  State<online> createState() => _onlineState();
}

class _onlineState extends State<online> {
  @override
  bool langauge = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: appButton(onTap: () {}, title: "How to tack "),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                    SizedBox(
                      width: 20,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => notification());
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                            "asstes/image/Bell-Icon.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: Get.height / 4.5,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Get.width / 1.85),
                          child: Container(
                            height: Get.height / 2,
                            width: Get.width / 1.5,
                            child: Image.asset(
                              "asstes/image/Group 10349.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Image.asset(
                          "asstes/image/Mask group (1).png",
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Lorem ipsum doller\nsit amet",
                                style: TextStyle(
                                    fontFamily: 'popins',
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: Get.height / 50,
                              ),
                              Container(
                                height: Get.height / 25,
                                width: Get.width / 3.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Read more",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const examlist());
                        },
                        child: Container(
                          height: Get.height / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/online-test 2.png',
                                scale: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Create online exam',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 14),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => viewexam());
                        },
                        child: Container(
                          height: Get.height / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/exam 1.png',
                                scale: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'View Exam',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 14),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => createclass());
                        },
                        child: Container(
                          height: Get.height / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/virtual-class 1.png',
                                scale: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Create Class',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 14),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => allclass());
                        },
                        child: Container(
                          height: Get.height / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/computer 1.png',
                                scale: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'All Class',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 14),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
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
}
