import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/prectice/prectice.dart';
import 'package:schooolapp/student/prectice/result.dart';
import 'package:schooolapp/student/prectice/selecttopic4.dart';
import '../../techers/units/api.dart';
import '../../techers/units/storage.dart';
import 'package:http/http.dart' as http;

List<Map> Arrey = [];

class TestMcqs extends StatefulWidget {
  const TestMcqs({Key? key}) : super(key: key);

  @override
  State<TestMcqs> createState() => _TestMcqsState();
}

class _TestMcqsState extends State<TestMcqs> {
  @override
  int select = 0;

  List chapters = [];
  bool loding = true;

  void initState() {
    McqAPI();
    select = 0;
    super.initState();
  }

  int next = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: loding == false
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: Get.height / 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  select != 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              select--;
                              next--;
                              save('Mcqs', chapters[select]);
                              print(select);
                            });
                          },
                          child: Container(
                            height: Get.height / 20,
                            width: Get.width / 6,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Back',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: Get.height / 20,
                          width: Get.width / 6,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Back',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                  select + 2 <= chapters.length
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              select++;
                              next++;
                              save('Mcqs', chapters[select]);
                              print(select);
                            });
                          },
                          child: Container(
                            height: Get.height / 20,
                            width: Get.width / 6,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Confirm',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Get.off(() => PrecticeResult(),
                                transition: Transition.topLevel);
                          },
                          child: Container(
                            height: Get.height / 20,
                            width: Get.width / 6,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                  select + 2 <= chapters.length
                      ? InkWell(
                          onTap: () {
                            setState(() {});
                            select++;
                            next++;
                            print(select);
                            save('Mcqs', chapters[select]);
                          },
                          child: Container(
                            height: Get.height / 20,
                            width: Get.width / 6,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: Get.height / 20,
                          width: Get.width / 6,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                ],
              ),
            )
          : SizedBox(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: loding == false
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Get.height / 80, horizontal: Get.width / 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: Get.height / 20,
                            width: Get.width / 9,
                          ),
                          Text(
                            "Question: ${next}/${chapters.length}",
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
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width / 1.1,
                            child: Text(
                              "$next\t${getdata.read('Mcqs')['mcq_question'] ?? ""}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.transparent,
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text(
                                  getdata.read('Mcqs')['mcqs_option1'] ?? "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.transparent,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text(
                                  getdata.read('Mcqs')['mcqs_option2'] ?? "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        child: Container(
                          // height: Get.height / 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.transparent,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text(
                                  getdata.read('Mcqs')['mcqs_option3'] ?? "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.transparent,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text(
                                  getdata.read('Mcqs')['mcqs_option4'] ?? "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ))
            : const Center(
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
      ),
    );
  }

  McqAPI() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.MCqs));
    request.fields.addAll({"topicids": '${selectedToicIds}'});
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      print(val);
      if (val['success'] == true) {
        setState(() {
          chapters.clear();
        });
        int count = 0;
        val['Result'].forEach((e) {
          if (count < Count) {
            chapters.add(e);
            count++;
          }
        });
        val['Result'].forEach((e) {
          if (count < Count) {
            Arrey.add(e);
            count++;
          }
        });
        save('Mcqs', chapters[select]);
        setState(() {
          loding = false;
        });
      } else {
        setState(() {
          loding = false;
        });
      }
    } else {
      setState(() {
        loding = false;
      });
    }
  }
}
