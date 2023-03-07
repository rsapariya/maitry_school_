import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MCOs.dart';

class selecttopic extends StatefulWidget {
  const selecttopic({Key? key}) : super(key: key);

  @override
  State<selecttopic> createState() => _selecttopicState();
}

class _selecttopicState extends State<selecttopic> {
  int selectedindex = 0;
  List chapter = [
    {
      "no": "0.1",
      "name": "Topic no  01",
      "topic": "7 topics",
      "qest": "220 Question"
    },
    {
      "no": "0.2",
      "name": "Topic no  02",
      "topic": "19 topics",
      "qest": "200 Question"
    },
    {
      "no": "0.3",
      "name": "Topic no  03",
      "topic": "8 topics",
      "qest": "210 Question"
    },
    {
      "no": "0.4",
      "name": "Topic no  04",
      "topic": "6 topics",
      "qest": "20 Question"
    },
    {
      "no": "0.5",
      "name": "Topic no  05",
      "topic": "7 topics",
      "qest": "130 Question"
    },
    {
      "no": "0.6",
      "name": "Topic no  06",
      "topic": "10 topics",
      "qest": "100 Question"
    },
    {
      "no": "0.7",
      "name": "Topic no  07",
      "topic": "2 topics",
      "qest": "170 Question"
    },
    {
      "no": " 0.8",
      "name": "Topic no  08",
      "topic": "7 topics",
      "qest": "190 Question"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 80),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height:Get.height/20,
                        width:Get.width/9,
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
                      "Select Topic",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins Medium",
                          fontSize: 18),
                    ),
                    InkWell(
                      child: SizedBox(
                        child: Container(
                          height:Get.height/20,
                          width:Get.width/9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => mcqs(),transition:Transition.leftToRight);
                    },
                    child: Container(
                      height: Get.height / 25,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Next",
                            style: TextStyle(
                                fontFamily: 'popins', color: Colors.white),
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
                      // Get.off(() => pdfgenrat());
                    },
                    child: Container(
                      height: Get.height / 25,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Auto",
                            style: TextStyle(
                                fontFamily: 'popins', color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: Get.height / 1.3,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: chapter.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                    child: Container(
                      // height: Get.height / 13,
                      // width: Get.width / 3.7,
                      // color: Colors.grey.shade50,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      chapter[index]["no"],
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontFamily: 'Gilroy Medium'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        chapter[index]["name"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Gilroy Medium'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            chapter[index]["qest"],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: 'Gilroy Medium',
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: Get.height / 60,
                                      // ),
                                    ],
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      child: selectedindex == index
                                          ? Center(
                                              child: Icon(
                                                Icons.done,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                            )
                                          : SizedBox(),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: selectedindex == index
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          color: selectedindex == index
                                              ? Colors.blue
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: 60,
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
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
