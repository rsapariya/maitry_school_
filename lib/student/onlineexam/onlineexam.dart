import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/onlineexam/selecttopic.dart';

class selectchapters extends StatefulWidget {
  const selectchapters({Key? key}) : super(key: key);

  @override
  State<selectchapters> createState() => _selectchaptersState();
}

class _selectchaptersState extends State<selectchapters> {
  int selectedindex = 0;
  List chapter = [
    {
      "no": "0.1",
      "name": "chapter 01",
      "topic": "7 topics",
      "qest": "220 Qestions"
    },
    {
      "no": "0.2",
      "name": "chapter 02",
      "topic": "19 topics",
      "qest": "200 Qestions"
    },
    {
      "no": "0.3",
      "name": "chapter 03",
      "topic": "8 topics",
      "qest": "210 Qestions"
    },
    {
      "no": "0.4",
      "name": "chapter 04",
      "topic": "6 topics",
      "qest": "20 Qestions"
    },
    {
      "no": "0.5",
      "name": "chapter 05",
      "topic": "7 topics",
      "qest": "130 Qestions"
    },
    {
      "no": "0.6",
      "name": "chapter 06",
      "topic": "10 topics",
      "qest": "100 Qestions"
    },
    {
      "no": "0.7",
      "name": "chapter 07",
      "topic": "2 topics",
      "qest": "170 Qestions"
    },
    {
      "no": " 0.8",
      "name": "chapter 08",
      "topic": "7 topics",
      "qest": "190 Qestions"
    },
    {
      "no": " 0.8",
      "name": "chapter 08",
      "topic": "7 topics",
      "qest": "190 Qestions"
    },
    {
      "no": " 0.8",
      "name": "chapter 08",
      "topic": "7 topics",
      "qest": "190 Qestions"
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
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child:
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                            "asstes/image/profile/Search.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Physics",
                          style: TextStyle(
                              fontFamily: 'popins Medium',
                              color: Colors.black,
                              fontSize: 22),
                        ),
                        Text(
                          "33 Chapters",
                          style: TextStyle(
                              fontFamily: 'popins',
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      'asstes/image/profile/Group 10324.png',
                      scale: 3,
                    )
                  ],
                ),
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
                        Get.to(selecttopics(),transition:Transition.leftToRight);
                      });
                    },
                    child: Container(
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
                                            chapter[index]["topic"],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: 'Gilroy Medium',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
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
                                  Icon(
                                    Icons.navigate_next,
                                    color: Colors.grey,
                                  )
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
