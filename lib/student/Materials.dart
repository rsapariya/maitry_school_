import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Materials extends StatefulWidget {
  const Materials({Key? key}) : super(key: key);

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  @override
  bool langauge = true;
  List notifi = [
    {"a": "Physics Material"},
    {"a": "Chemistry Material"},
    {"a": "Mathematics Material"},
    {"a": "Biology Material"},
    {"a": "Empowering the world"},
    {"a": "Loream ipsum doller"},
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
                    "Short Material",
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
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  // controller: controller,
                  itemCount: notifi.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 40),
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
                                        color: Colors.blue.withOpacity(0.1)),
                                    child: Center(
                                        child: Image.asset(
                                      "asstes/image/PDF.png",
                                      scale: 5,
                                    ))),
                              ),
                              SizedBox(width: Get.width / 20),
                              Text(
                                notifi[index]["a"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "popins Medium",
                                    fontSize: 14),
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
