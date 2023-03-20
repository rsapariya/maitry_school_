import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import '../../techers/units/api.dart';
import '../../techers/units/storage.dart';

double total = 0;
double PR = 0;
int gget = 0;
int Posi = 0;

List Mcq = [];

class TestResults extends StatefulWidget {
  const TestResults({Key? key}) : super(key: key);
  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
  @override
  bool loding = true;

  void initState() {
    GetResult();
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
                                  Get.back();
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
                                      "User Name : ${getdata.read('Map')['user']}\nExam Name : ${getdata.read('Map')['examname']}\nTotal Marks : ${getdata.read('Map')['total']}\nObtained Marks : ${getdata.read('Map')['obtained']}}",
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
                                        getdata.read('Map')['user'] ?? "",
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
                                    child: Text(
                                        getdata.read('Map')['examname'] ?? "",
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
                                    child: Text(getdata.read('Map')['total'],
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
                                    child: Text(getdata.read('Map')['obtained'],
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
                                      child: Text(getdata.read('Map')['date'],
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
                            itemCount: Mcq.length,
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
                                      child: Text(
                                        Mcq[index]['mcq_question'] ?? "",
                                        style: const TextStyle(
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
                                        child: SizedBox(
                                            width: Get.width / 1.3,
                                            child: Text(
                                                "A ${Mcq[index]['mcqs_option1']}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ))))),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    // height: Get.height / 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.transparent)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: Get.width / 1.3,
                                            child: Text(
                                                "B ${Mcq[index]['mcqs_option2']}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ))))),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    // height: Get.height / 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.transparent)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: Get.width / 1.3,
                                            child: Text(
                                                "C ${Mcq[index]['mcqs_option3']}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ))))),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    // height: Get.height / 20,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.transparent)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: Get.width / 1.3,
                                            child: Text(
                                                "D ${Mcq[index]['mcqs_option4']}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ))))),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Mcq[index]["test_answer"]
                                                  .toString() !=
                                              Mcq[index]["mcqs_answer"]
                                                  .toString()
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
                                        "Answer:${Mcq[index]['mcqs_answer']} Your choice ${Mcq[index]['test_answer']}",
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

  GetResult() async {
    var request = http.MultipartRequest(
        'GET', Uri.parse(AppUrl.Result + getdata.read('TestID')));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(parse(respStr).documentElement?.text ?? '');
    print(respStr);

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
        Mcq.clear();
        setState(() {});
        val['Result'].forEach((e) {
          Mcq.add(e);
        });
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
