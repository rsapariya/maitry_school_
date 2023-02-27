import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/student/viewmacq/selecttopic.dart';
import 'package:schooolapp/techers/units/storage.dart';
import '../../techers/units/api.dart';

class selectchapters extends StatefulWidget {
  const selectchapters({Key? key}) : super(key: key);

  @override
  State<selectchapters> createState() => _selectchaptersState();
}

class _selectchaptersState extends State<selectchapters> {
  @override
  void initState() {
    Getchapter();
    super.initState();
  }

  bool loding = true;
  int selectedindex = 0;
  List chapter = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: loding == false
            ? Padding(
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
                              setState(() {
                                save('chepterid', chapter[index]["chapter_id"]);
                              });
                              Get.to(selecttopics(),
                                  transition: Transition.leftToRight);
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: Get.width / 1.2,
                                              child: Text(
                                                chapter[index]
                                                        ["chapter_name"] ??
                                                    "",
                                                maxLines: 5,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        'Gilroy Medium'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            // Row(
                                            //   children: [
                                            //     Text(
                                            //       chapter[index]["topic"] ?? "",
                                            //       style: TextStyle(
                                            //         color: Colors.grey,
                                            //         fontSize: 12,
                                            //         fontFamily: 'Gilroy Medium',
                                            //       ),
                                            //     ),
                                            //     SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     Text(
                                            //       chapter[index]["qest"] ?? "",
                                            //       style: TextStyle(
                                            //         color: Colors.grey,
                                            //         fontSize: 12,
                                            //         fontFamily: 'Gilroy Medium',
                                            //       ),
                                            //     ),
                                            //   ],
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
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
      ),
    );
  }

  Getchapter() async {
    print(
        "---------------- GETCHAPTER _________${getdata.read('logindata')['Result']['user_api'].toString()}_________-");

    var request =
        http.Request('GET', Uri.parse('https://maitriapp.in/api/v1/chapter/1'));

    request.headers.addAll(headers);

    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      print(val);
      val['Result'].forEach((e) {
        chapter.add(e);
      });
      setState(() {
        loding = false;
      });
      print(chapter);
    } else {
      print(val);
      setState(() {
        loding = false;
      });
    }
  }
}
