import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/dashboard/bottombar/home/onlineexam/createexam/qestionpaper.dart';
import 'package:schooolapp/dashboard/bottombar/home/onlineexam/view/viewmcq.dart';
import 'package:schooolapp/units/storage.dart';

class examlist extends StatefulWidget {
  const examlist({Key? key}) : super(key: key);

  @override
  State<examlist> createState() => _examlistState();
}

class _examlistState extends State<examlist> {
  int selectedindex = 0;
  List chapter = [
    {
      "name": "1st Chapter Ravi",
      "date": "20/08/2022",
      "time": "04:30 PM",
      "no": "01."
    },
    {
      "name": "2nd Chapter Ravi",
      "date": "21/08/2022",
      "time": "04:30 PM",
      "no": "02."
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
                    Text(
                      "Exam List",
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
              SizedBox(
                height: Get.height / 1.3,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: chapter.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {

                          Get.to(() => qestionpaper());

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
                                            chapter[index]["date"],
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
                                            chapter[index]["time"],
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
                                      child: Image.asset(
                                        'asstes/image/profile/delet.png',
                                        scale: 3.5,
                                      )),
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