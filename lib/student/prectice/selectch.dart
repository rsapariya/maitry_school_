import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/pdf/selecttopic.dart';

class precticechapter extends StatefulWidget {
  const precticechapter({Key? key}) : super(key: key);

  @override
  State<precticechapter> createState() => _precticechapterState();
}

class _precticechapterState extends State<precticechapter> {
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: Get.height / 17,
        width: Get.width / 4,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(60)),
        child: const Center(
          child: Text(
            "Next",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Gilroy Medium'),
          ),
        ),
      ),
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
                    Text(
                      "Select Chapter",
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
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Row(
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Prectice Test",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: "popins Medium"),
                        )
                      ],
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
                        selectedindex = index;
                        print(selectedindex);
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
