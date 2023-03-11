import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/prectice/selecttopic4.dart';
import 'package:http/http.dart' as http;
import '../../techers/units/api.dart';
import '../../techers/units/storage.dart';

List<String> _selectedChapterNames = [];

class precticechapter extends StatefulWidget {
  const precticechapter({Key? key}) : super(key: key);
  @override
  State<precticechapter> createState() => _precticechapterState();
}

class _precticechapterState extends State<precticechapter> {
  @override
  void initState() {
    Getchapter();
    super.initState();
  }



  int selectedindex = 0;
  List chapter = [];
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            Get.to(Testtopic(), transition: Transition.leftToRight);
          });
        },
        child: Container(
          height: Get.height / 17,
          width: Get.width / 4,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(60)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Gilroy Medium'),
            ),
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
                        child: const Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height / 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Row(
                  children: [
                    const Text(
                      "Prectice Test",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: "popins Medium"),
                    ),
                    const Spacer(),
                    Image.asset(
                      'asstes/image/profile/Group 10324.png',
                      scale: 3,
                    )
                  ],
                ),
              ),
              SizedBox(height: Get.height / 40),
              loading == false
                  ? SizedBox(
                      height: Get.height / 1.3,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: chapter.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              if (chapter[index]['created_at'] == "true") {
                                chapter[index]['created_at'] = "false";
                              } else {
                                chapter[index]['created_at'] = "true";
                              }
                              print(chapter[index]['created_at']);
                            });
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
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
                                                chapter[index]["chapter_name"],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        'Gilroy Medium'),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: chapter[index][
                                                                'created_at'] ==
                                                            "true"
                                                        ? Colors.blue
                                                        : Colors.grey),
                                                color: chapter[index]
                                                            ['created_at'] ==
                                                        "true"
                                                    ? Colors.blue
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: chapter[index]
                                                        ['created_at'] ==
                                                    "true"
                                                ? const Center(
                                                    child: Icon(
                                                      Icons.done,
                                                      size: 12,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    indent: 60,
                                    thickness: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
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
        loading = false;
      });
      print(chapter);
    } else {
      print(val);
      setState(() {
        loading = false;
      });
    }
  }
}

List a = [
  {'id': '1', "name": "saimol"},
  {'id': '2', "name": "saimol"},
  {'id': '12', "name": "saimol"},
  {'id': '23', "name": "saimol"},
  {'id': '11', "name": "saimol"},
  {'id': '16', "name": "saimol"},
  {'id': '19', "name": "saimol"},
  {'id': '91', "name": "saimol"},
];
