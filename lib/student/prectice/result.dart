// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/prectice/prectice.dart';
import 'package:schooolapp/student/prectice/testmcq.dart';
import '../../techers/units/storage.dart';

int total = 0;
int gget = 0;

class PrecticeResult extends StatefulWidget {
  const PrecticeResult({Key? key}) : super(key: key);
  @override
  State<PrecticeResult> createState() => _PrecticeResultState();
}

class _PrecticeResultState extends State<PrecticeResult> {
  @override
  void initState() {
    Totel();
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
                            Totel();
                          },
                          child: Container(
                              height: Get.height / 20,
                              width: Get.width / 9,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
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
                        horizontal: Get.width / 30, vertical: Get.height / 100),
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
                                child: const Text('8 %',
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
                            itemBuilder: (context, index) => Column(children: [
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
                                            child: Text(
                                                Arrey[index]["mcq_question"] ??
                                                    "",
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
                                      onTap: () {},
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.transparent)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                  width: Get.width / 1.3,
                                                  child: Text(
                                                      "A ${Arrey[index]["mcqs_option1"]}",
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )))))),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          // height: Get.height / 20,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.transparent)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                  width: Get.width / 1.3,
                                                  child: Text(
                                                      "B ${Arrey[index]["mcqs_option2"]}",
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )))))),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          // height: Get.height / 20,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.transparent)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                  width: Get.width / 1.3,
                                                  child: Text(
                                                      "C ${Arrey[index]["mcqs_option3"]}",
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )))))),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          // height: Get.height / 20,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.transparent)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                  width: Get.width / 1.3,
                                                  child: Text(
                                                      "D ${Arrey[index]["mcqs_option4"]}",
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )))))),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Arrey[index]["Marks"]
                                                      .toString() ==
                                                  "0"
                                              ? Colors.red
                                              : Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Divider(
                                    color: Colors.blue,
                                    thickness: 1,
                                  )
                                ]))))
              ],
            ),
          ),
        ));
  }

  Totel() {
    int Posi = getdata.read('One');

    gget = (Count * Posi);
    for (int i = 0; i < Arrey.length; i++) {
      if (Arrey[i]["Marks"] == 0) {
        total -= 1;
      } else {
        total += Posi;
      }
    }
    setState(() {});
    print("------     total      --->> $total");
  }
}
