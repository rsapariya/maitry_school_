import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:schooolapp/student/prectice/resultstest.dart';
import 'package:http/http.dart' as http;
import '../../techers/units/api.dart';
import '../../techers/units/storage.dart';
import '../bottoms.dart';
import '../home.dart';

class AllTest extends StatefulWidget {
  const AllTest({Key? key}) : super(key: key);
  @override
  State<AllTest> createState() => _AllTestState();
}

class _AllTestState extends State<AllTest> {
  @override
  void initState() {
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
              child: Column(
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
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Image.asset("asstes/image/backwrrow.png",
                                scale: 1.5),
                          ),
                        ),
                      ),
                      const Text(
                        "All Tests",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins Medium",
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: Get.height / 20,
                        width: Get.width / 9,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: RefreshIndicator(
                        child: ListView.builder(
                          itemCount: Alltest.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: Get.height / 80),
                            child: InkWell(
                              child: Container(
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
                                                getdata.read('logindata')[
                                                            'Result']
                                                        ['user_name'] ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontFamily:
                                                        'popins Medium')))
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
                                                Alltest[index]['tests_name'] ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontFamily:
                                                        'popins Medium')))
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
                                            child: Text(
                                                Alltest[index]['tests_marks']
                                                        .toString() ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontFamily:
                                                        'popins Medium')))
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
                                            child: Text(
                                                Alltest[index][
                                                            'test_obtaine_mark']
                                                        .toString() ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontFamily:
                                                        'popins Medium')))
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
                                              child: Text(
                                                  Alltest[index][
                                                              'test_obtaine_mark']
                                                          .toString() ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily:
                                                          'popins Medium')))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: Get.width / 3,
                                              child: const Text('Result Date',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'popins'))),
                                          SizedBox(
                                              width: Get.width / 2,
                                              child: Text(
                                                  Alltest[index]
                                                              ['test_curt_time']
                                                          .toString() ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily:
                                                          'popins Medium')))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                var deta = {
                                  "user": getdata.read('logindata')['Result']
                                      ['user_name'],
                                  "examname":
                                      Alltest[index]['tests_name'].toString(),
                                  "total":
                                      Alltest[index]['tests_marks'].toString(),
                                  "obtained": Alltest[index]
                                          ['test_obtaine_mark']
                                      .toString(),
                                  "date": Alltest[index]['test_curt_time']
                                      .toString(),
                                };
                                setState(() {});
                                save('TestID',
                                    Alltest[index]['tests_id'].toString());
                                save('Map', deta);
                                Get.to(() => TestResults());
                              },
                            ),
                          ),
                        ),
                        onRefresh: regresher,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  Future<void> regresher() async {
    Alltestapi();
  }

  Alltestapi() async {
    print("--------------ALLLLLTEST _____________");
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.AllTestApi));
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
          Alltest.clear();
        });
        val['Result'].forEach((e) {
          Alltest.add(e);
        });
        print("--------------ALLLLLTEST _____________$Alltest");
        setState(() {});
      } else {
        setState(() {});
      }
    } else {
      setState(() {});
    }
  }
}
