
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/pdf/PDFpaper.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/pendingreqest/pendingreqeust.dart';
import '../../../units/cusomewidget.dart';
import 'notification.dart';
import 'onlineexam/onlineexam.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? token;
  @override
  void initState() {
    request();
    FirebaseMessaging.instance.getToken().then((value) {
      setState(() {
        token = value;
      });
      print("------ddddddddddddddddd--------------------------");

      print(token);
    });
    super.initState();
  }

  void request() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      provisional: false,
      sound: true,
    );
  }

  @override
  bool langauge = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          appButton(onTap: () {}, title: "How to tack this app"),
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
                        setState(() {
                          langauge = true;
                        });
                      },
                      child: Container(
                        height: Get.height / 25,
                        decoration: BoxDecoration(
                            color: langauge == true
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Gujarati",
                              style: TextStyle(
                                  fontFamily: 'popins',
                                  color: langauge == true
                                      ? Colors.white
                                      : Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          langauge = false;
                        });
                      },
                      child: Container(
                        height: Get.height / 25,
                        decoration: BoxDecoration(
                            color: langauge == false
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "English",
                              style: TextStyle(
                                  fontFamily: 'popins',
                                  color: langauge == false
                                      ? Colors.white
                                      : Colors.blue),
                            ),
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
                        Get.to(() => notification(),
                            transition: Transition.leftToRight);
                      },
                      child: Container(
                        height: Get.height / 20,
                        width: Get.width / 9,
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
                          Get.to(() => pdfgenrat(),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          height: Get.height / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/pdf 1.png',
                                scale: 3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'PDF Paper Genrate',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 14),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.10),
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
                          Get.to(() => online(),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          height: Get.height / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/exam 2.png',
                                scale: 3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Online Exam',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 14),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => pendingreqest(),
                        transition: Transition.leftToRight);
                  },
                  child: Container(
                    height: Get.height / 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asstes/image/profile/patient.png',
                          scale: 12,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'View Panding Request',
                            style:
                                TextStyle(fontFamily: 'popins', fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
