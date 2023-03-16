// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
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
  var SelectedMCQ;
  List chapters = [];
  bool loding = true;
  void initState() {
    McqAPI();
    Arrey.clear();
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
                                  child: Text('Back',
                                      style: TextStyle(color: Colors.white)))))
                      : Container(
                          height: Get.height / 20,
                          width: Get.width / 6,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text('Back',
                                  style: TextStyle(color: Colors.blue)))),
                  select + 2 <= chapters.length
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              OnTap();
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
                              ))))
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
                              )))),
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
                              ))))
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
                          )))
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
                  child: Column(children: [
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
                          )
                        ]),
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
                                  )))
                        ]),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          SelectedMCQ = getdata.read('Mcqs')['mcqs_option1'];
                          save('student_ans', 'A');
                          setState(() {});
                          print(getdata.read('student_ans'));
                        },
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: SelectedMCQ ==
                                          getdata.read('Mcqs')['mcqs_option1']
                                      ? Colors.blue
                                      : Colors.transparent,
                                )),
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                        'A. ${getdata.read('Mcqs')['mcqs_option1'] ?? ""}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        )))))),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        SelectedMCQ = getdata.read('Mcqs')['mcqs_option2'];
                        save('student_ans', 'B');
                        setState(() {});
                        print(getdata.read('student_ans'));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: SelectedMCQ ==
                                    getdata.read('Mcqs')['mcqs_option2']
                                ? Colors.blue
                                : Colors.transparent,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: Get.width / 1.3,
                            child: Text(
                              'B. ${getdata.read('Mcqs')['mcqs_option2'] ?? ""}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          SelectedMCQ = getdata.read('Mcqs')['mcqs_option3'];
                          save('student_ans', 'C');
                          setState(() {});
                          print(getdata.read('student_ans'));
                        },
                        child: Container(
                            // height: Get.height / 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: SelectedMCQ ==
                                          getdata.read('Mcqs')['mcqs_option3']
                                      ? Colors.blue
                                      : Colors.transparent,
                                )),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width / 1.3,
                                  child: Text(
                                      'C. ${getdata.read('Mcqs')['mcqs_option3'] ?? ""}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      )),
                                )))),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          SelectedMCQ = getdata.read('Mcqs')['mcqs_option4'];
                          save('student_ans', 'D');
                          setState(() {});
                          print(getdata.read('student_ans'));
                        },
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: SelectedMCQ ==
                                        getdata.read('Mcqs')['mcqs_option4']
                                    ? Colors.blue
                                    : Colors.transparent,
                              ),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                        'D. ${getdata.read('Mcqs')['mcqs_option4'] ?? ""}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        )))))),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
                ))
            : const Center(
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
      ),
    );
  }

  McqAPI() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.MCqs));
    request.fields.addAll({
      "topicids": '$selectedToicIds',
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(parse(respStr).documentElement?.text ?? '');
    String jsonString = jsonEncode(val);
    jsonString = jsonString
        .replaceAll('</p>', "")
        .replaceAll('</span>', "")
        .replaceAll('</td>', "")
        .replaceAll('</tr>', "")
        .replaceAll('</o:p>', "")
        .replaceAll('</table>', "")
        .replaceAll('</tbody>', "");

    val = jsonDecode(jsonString);

    if (response.statusCode == 200) {
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

  OnTap() async {
    if (getdata.read('student_ans').toString() ==
        getdata.read('Mcqs')['mcqs_answer'].toString()) {
      Arrey.add({
        "mcqs_id": getdata.read('Mcqs')['mcqs_id'],
        "mcq_question": getdata.read('Mcqs')['mcq_question'],
        "mcqs_option1": getdata.read('Mcqs')['mcqs_option1'],
        "mcqs_option2": getdata.read('Mcqs')['mcqs_option2'],
        "mcqs_option3": getdata.read('Mcqs')['mcqs_option3'],
        "mcqs_option4": getdata.read('Mcqs')['mcqs_option4'],
        "mcqs_answer": getdata.read('Mcqs')['mcqs_answer'],
        "student_ans": getdata.read('student_ans'),
        "Marks": 1,
      });
      print(Arrey[select]['Marks'].toString());
    } else {
      Arrey.add({
        "mcqs_id": getdata.read('Mcqs')['mcqs_id'],
        "mcq_question": getdata.read('Mcqs')['mcq_question'],
        "mcqs_option1": getdata.read('Mcqs')['mcqs_option1'],
        "mcqs_option2": getdata.read('Mcqs')['mcqs_option2'],
        "mcqs_option3": getdata.read('Mcqs')['mcqs_option3'],
        "mcqs_option4": getdata.read('Mcqs')['mcqs_option4'],
        "mcqs_answer": getdata.read('Mcqs')['mcqs_answer'],
        "student_ans": getdata.read('student_ans'),
        "Marks": 0,
      });
      print(Arrey[select]['Marks'].toString());
    }

    setState(() {});
    print('===');
    // print(getdata.read('Mcqs')['mcqs_id']);
    // print(Arrey.length);
  }
}
