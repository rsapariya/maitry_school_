// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/student/prectice/prectice.dart';
import 'package:schooolapp/student/prectice/testmcq.dart';
import 'package:share/share.dart';
import '../../techers/units/api.dart';
import '../../techers/units/storage.dart';
import '../bottoms.dart';

double total = 0;
double PR = 0;
int gget = 0;
int Posi = 0;

class PrecticeResult extends StatefulWidget {
  const PrecticeResult({Key? key}) : super(key: key);
  @override
  State<PrecticeResult> createState() => _PrecticeResultState();
}

class _PrecticeResultState extends State<PrecticeResult> {
  @override
  bool loding = true;

  void initState() {
    Totel();
    TestAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Get.height / 80, horizontal: Get.width / 30),
            child: loding == false
                ? Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.offAll(() => const bottoms());
                                },
                                child: Container(
                                    height: Get.height / 20,
                                    width: Get.width / 9,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Image.asset(
                                            "asstes/image/backwrrow.png",
                                            scale: 1.5)))),
                            const Text(
                              "Result",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "popins Medium",
                                  fontSize: 18),
                            ),
                            InkWell(
                                onTap: () {
                                  Share.share(
                                      "User Name : ${getdata.read('logindata')['Result']['user_name']}\nExam Name : ${getdata.read('testname')}\nTotal Marks : ${gget.toString()}\nObtained Marks : ${total.toString()}\nPercentage : ${PR.toString()}",
                                      subject: "Result");
                                },
                                child: Container(
                                    height: Get.height / 20,
                                    width: Get.width / 9,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Image.asset(
                                      "asstes/image/profile/share.png",
                                      scale: 4,
                                      color: Colors.white,
                                    ))))
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: Get.height / 5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width / 30,
                              vertical: Get.height / 100),
                          child: Column(
                            children: [
                              Row(children: [
                                SizedBox(
                                    width: Get.width / 3,
                                    child: const Text('User Name',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'popins'))),
                                SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                        getdata.read('logindata')['Result']
                                                ['user_name'] ??
                                            "",
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontFamily: 'popins Medium')))
                              ]),
                              Row(children: [
                                SizedBox(
                                    width: Get.width / 3,
                                    child: const Text('Exam Name',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'popins'))),
                                SizedBox(
                                    width: Get.width / 2,
                                    child: Text(getdata.read('testname') ?? "",
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontFamily: 'popins Medium')))
                              ]),
                              Row(children: [
                                SizedBox(
                                    width: Get.width / 3,
                                    child: const Text("Total Marks",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'popins'))),
                                SizedBox(
                                    width: Get.width / 2,
                                    child: Text(gget.toString(),
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontFamily: 'popins Medium')))
                              ]),
                              Row(children: [
                                SizedBox(
                                    width: Get.width / 3,
                                    child: const Text('Obtained Marks',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'popins'))),
                                SizedBox(
                                    width: Get.width / 2,
                                    child: Text(total.toString(),
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontFamily: 'popins Medium')))
                              ]),
                              Row(
                                children: [
                                  SizedBox(
                                      width: Get.width / 3,
                                      child: const Text('Percentage',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'popins'))),
                                  SizedBox(
                                      width: Get.width / 2,
                                      child: Text("${PR.toString()}%",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: 'popins Medium')))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: Arrey.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        """${Arrey[index]["mcq_question"]}""",
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 20,
                                          child: const Text(
                                            "A",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.2,
                                          child: HtmlWidget(
                                            """${Arrey[index]["mcqs_option1"]}""",
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 20,
                                          child: const Text(
                                            "B",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.2,
                                          child: HtmlWidget(
                                            """${Arrey[index]["mcqs_option2"]}""",
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 20,
                                          child: const Text(
                                            "C",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.2,
                                          child: HtmlWidget(
                                            """${Arrey[index]["mcqs_option3"]}""",
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 20,
                                          child: const Text(
                                            "D",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.2,
                                          child: HtmlWidget(
                                            """${Arrey[index]["mcqs_option4"]}""",
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Arrey[index]["Marks"].toString() ==
                                              "0"
                                          ? Colors.red
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: Get.width / 1.3,
                                      child: Text(
                                        "Answer:${Arrey[index]["Result"]}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
          ),
        ));
  }

  Totel() {
    Posi = getdata.read('One');
    double Nega = isnagative ? 0 : nagetive;
    print(Nega);
    total = 0;
    gget = (Count * Posi);
    for (int i = 0; i < Arrey.length; i++) {
      if (Arrey[i]["Marks"] == 0) {
        total -= Nega;
      } else {
        total += Posi;
      }
    }
    if (total <= 0) {
      PR = 0;
    } else {
      PR = total / gget * 100;
    }
    print(PR);
    setState(() {});
    print("------     total      --->> $total");
    TestAPI();
  }

  TestAPI() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.PostTest));
    request.headers.addAll(headers);
    request.fields.addAll({
      'tests_name': getdata.read('testname'),
      'tests_marks': gget.toString(),
      'test_obtaine_mark': total.toString(),
      'test_answers': "{${Arrey}",
      'c_datetime': DateTime.now().toString(),
      'isnegative': '0',
      'markofques': Posi.toString(),
    });
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        loding = false;
        setState(() {});
        print("Success $val");
      } else {
        loding = false;
        print("Succ 11 $val");

        setState(() {});
      }
    } else {
      setState(() {
        print("Succ 222 ess $val");

        loding = false;
      });
    }
  }
}
