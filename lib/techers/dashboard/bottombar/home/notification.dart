// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../student/home.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool langauge = true;

  @override
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
                  const Text(
                    "Notification",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins Medium",
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: Get.height / 20,
                    width: Get.width / 9,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Notifications.isNotEmpty
                    ? ListView.builder(
                        itemCount: Notifications.length,
                        itemBuilder: (_, index) {
                          return Column(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HtmlWidget(
                                        Notifications[index]["title"] ?? "",
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: "popins Medium",
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.3,
                                        child: HtmlWidget(
                                          Notifications[index]["description"] ??
                                              "",
                                          textStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "popins",
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Divider()
                            ],
                          );
                        },
                      )
                    : SizedBox(
                        child: Center(
                          child: Text(
                            'No Data',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontFamily: "popins"),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
