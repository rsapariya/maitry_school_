import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class onlinetest extends StatefulWidget {
  const onlinetest({Key? key}) : super(key: key);

  @override
  State<onlinetest> createState() => _onlinetestState();
}

class _onlinetestState extends State<onlinetest> {
  @override
  bool langauge = true;
  List notifi = [
    {"a": "Loream ipsum", "b": "About 1 min ago"},
    {"a": "Ralaable contante page", "b": "About 12 min ago"},
    {"a": "Loream ipsum is not a contant", "b": "About 29 min ago"},
    {"a": "Browse other questions tagged", "b": "29 August"},
    {"a": "Empowering the world", "b": "16 August"},
    {"a": "Loream ipsum doller", "b": "8 August"},
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 9,
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
                    "Online test",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins Medium",
                        fontSize: 18),
                  ),
                  InkWell(
                    child: SizedBox(
                      child: Container(
                        height: Get.height / 20,
                        width: Get.width / 9,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ExamList.isEmpty
                    ? Center(
                        child: Text("Exam no found",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontFamily: 'popins')),
                      )
                    : ListView.builder(
                        itemCount: notifi.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Get.height / 120),
                                      child: Container(
                                          width: Get.width / 10,
                                          height: Get.height / 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.blue.withOpacity(0.1)),
                                          child: Center(
                                              child: Image.asset(
                                            "asstes/image/Ticket Star.png",
                                            scale: 3,
                                          ))),
                                    ),
                                    SizedBox(width: Get.width / 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notifi[index]["a"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "popins Medium",
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.7,
                                          child: Text(
                                            notifi[index]["b"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "popins",
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.more_vert_outlined,
                                      size: 20,
                                      color: Colors.black.withOpacity(0.6),
                                    )
                                  ],
                                ),
                                Divider()
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
