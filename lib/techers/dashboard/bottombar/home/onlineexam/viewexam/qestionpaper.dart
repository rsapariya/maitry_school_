import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../../login/mainscreen.dart';
import '../../../../../units/api.dart';
import '../../../../../units/storage.dart';

class qestionpaper extends StatefulWidget {
  const qestionpaper({Key? key}) : super(key: key);

  @override
  State<qestionpaper> createState() => _qestionpaperState();
}

class _qestionpaperState extends State<qestionpaper> {
  int selectedindex = 0;
  List Mcqsofpaper = [];
  bool loding = true;

  @override
  void initState() {
    GetMcqsofExam();
    super.initState();
  }

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
                      "Question Paper",
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
              loding == false
                  ? Expanded(
                      child: Mcqsofpaper.isNotEmpty
                          ? SizedBox(
                              child: ListView.builder(
                                itemCount: Mcqsofpaper.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 30),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("${index + 1}",
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: Get.width / 1.3,
                                            child: HtmlWidget(
                                                """${Mcqsofpaper[index]["mcq_question"]}""",
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Mcqsofpaper[index]
                                                            ['mcqs_answer'] ==
                                                        "A"
                                                    ? Colors.green
                                                        .withOpacity(0.2)
                                                    : Colors.grey
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Mcqsofpaper[index][
                                                                'mcqs_answer'] ==
                                                            "A"
                                                        ? Colors.green
                                                        : Colors.transparent)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: Get.width / 20,
                                                      child: const Text(
                                                        "A",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: Get.width / 1.2,
                                                    child: HtmlWidget(
                                                      """${Mcqsofpaper[index]['mcqs_option1']}""",
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Mcqsofpaper[index]
                                                            ['mcqs_answer'] ==
                                                        "B"
                                                    ? Colors.green
                                                        .withOpacity(0.2)
                                                    : Colors.grey
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Mcqsofpaper[index][
                                                                'mcqs_answer'] ==
                                                            "B"
                                                        ? Colors.green
                                                        : Colors.transparent)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: Get.width / 20,
                                                      child: const Text(
                                                        "B",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: Get.width / 1.2,
                                                    child: HtmlWidget(
                                                      """${Mcqsofpaper[index]['mcqs_option2']}""",
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Mcqsofpaper[index]
                                                            ['mcqs_answer'] ==
                                                        "C"
                                                    ? Colors.green
                                                        .withOpacity(0.2)
                                                    : Colors.grey
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Mcqsofpaper[index][
                                                                'mcqs_answer'] ==
                                                            "C"
                                                        ? Colors.green
                                                        : Colors.transparent)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: Get.width / 20,
                                                      child: const Text(
                                                        "C",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: Get.width / 1.2,
                                                    child: HtmlWidget(
                                                      """${Mcqsofpaper[index]['mcqs_option3']}""",
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Mcqsofpaper[index]
                                                            ['mcqs_answer'] ==
                                                        "D"
                                                    ? Colors.green
                                                        .withOpacity(0.2)
                                                    : Colors.grey
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Mcqsofpaper[index][
                                                                'mcqs_answer'] ==
                                                            "D"
                                                        ? Colors.green
                                                        : Colors.transparent)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: Get.width / 20,
                                                      child: const Text(
                                                        "D",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: Get.width / 1.2,
                                                    child: HtmlWidget(
                                                      """${Mcqsofpaper[index]['mcqs_option4']}""",
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Divider(
                                        color: Colors.blue,
                                        thickness: 1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Data",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "popins",
                                    fontSize: 18),
                              ),
                            ))
                  : Expanded(
                      child: SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.blue,
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }

  GetMcqsofExam() async {
    var request = http.MultipartRequest(
        'GET', Uri.parse(AppUrl.Getmcq + getdata.read('Examid')));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);
    if (response.statusCode == 200) {
      if (val['success'] == true) {
        Mcqsofpaper.clear();
        setState(() {});
        print(val);
        val['Result'].forEach((e) {
          Mcqsofpaper.add(e);
        });
        setState(() {
          loding = false;
        });
        print(Mcqsofpaper);
      } else {
        print(val);
        setState(() {
          Mcqsofpaper.clear();
          loding = false;
        });
      }
    } else {
      print(val);
      setState(() {
        loding = false;
      });
    }
  }
}
