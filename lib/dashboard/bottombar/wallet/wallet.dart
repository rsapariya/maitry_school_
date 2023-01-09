import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../units/cusomewidget.dart';

class wallet extends StatefulWidget {
  const wallet({Key? key}) : super(key: key);

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
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
          padding: EdgeInsets.symmetric(vertical: Get.height / 80),
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
                    "Subscription",
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
              Expanded(
                child: ListView.builder(
                  // controller: controller,
                  itemCount: notifi.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 30,
                          vertical: Get.height / 80),
                      child: Container(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Sr.Number",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: "popins Medium"),
                                  ),
                                  Spacer(),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "asstes/image/Placeholder.png",
                                          scale: 2.5,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "STD 11&12 Neet 2022",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "asstes/image/bx_rupee.png",
                                          scale: 2.5,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Amount",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "₹ 249",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "asstes/image/Icon-Activity.png",
                                          scale: 2.5,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Last date",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "2022-12-08",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 20, vertical: 10),
                                  child: Text(
                                    "Subscibe Now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                // offset: Offset(9,7),
                                spreadRadius:4,
                                blurRadius: 5,
                                color: Colors.grey.withOpacity(0.1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10)),
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