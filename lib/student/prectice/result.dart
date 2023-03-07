import 'package:appbar_animated/appbar_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../techers/units/storage.dart';

class PrecticeResult extends StatefulWidget {
  const PrecticeResult({Key? key}) : super(key: key);

  @override
  State<PrecticeResult> createState() => _PrecticeResultState();
}

class _PrecticeResultState extends State<PrecticeResult> {
  int selectedindex = 0;
  List chapter = [
    {
      "no": "0.1",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 4",
      "qest": "220 Question"
    },
    {
      "no": "0.2",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 1",
      "qest": "200 Question"
    },
    {
      "no": "0.3",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 3",
      "qest": "210 Question"
    },
    {
      "no": "0.4",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 2",
      "qest": "20 Question"
    },
    {
      "no": "0.5",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 1",
      "qest": "130 Question"
    },
    {
      "no": "0.6",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 2",
      "qest": "100 Question"
    },
    {
      "no": "0.7",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 3 ",
      "qest": "170 Question"
    },
    {
      "no": " 0.8",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 2",
      "qest": "190 Question"
    },
  ];
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
                          scale: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Result",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins Medium",
                        fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      // Get.back();
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 3,
                            child: const Text(
                              'User Name',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'popins'),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              getdata.read('logindata')['Result']
                                      ['user_name'] ??
                                  "",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'popins Medium'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 3,
                            child: const Text(
                              'Exam Name',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'popins'),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2,
                            child: const Text(
                              "Test",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'popins Medium'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 3,
                            child: const Text(
                              'Total Marks',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'popins'),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2,
                            child: const Text(
                              "10",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'popins Medium'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 3,
                            child: const Text(
                              'Obtained Marks',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'popins'),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2,
                            child: const Text(
                              '0.5',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'popins Medium'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 3,
                            child: const Text(
                              'Percentage',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'popins'),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2,
                            child: const Text(
                              '8 %',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'popins Medium'),
                            ),
                          ),
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
                  itemCount: chapter.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    // height: Get.height / 13,
                    // width: Get.width / 3.7,
                    // color: Colors.grey.shade50,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(chapter[index]["no"],
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
                              child: Text(chapter[index]["name"],
                                  style: const TextStyle(
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
                          onTap: () {

                          },
                          child: Container(
                            // height: Get.height / 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: Get.width / 1.3,
                                child: const Text("A. loraem ipsum",
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
                          onTap: () {

                          },
                          child: Container(
                            // height: Get.height / 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: Get.width / 1.3,
                                child: const Text(
                                    "B. loream ipsum dummy text for editing ",
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
                          onTap: () {

                          },
                          child: Container(
                            // height: Get.height / 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: Get.width / 1.3,
                                child: const Text("C. The extrims of evil",
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
                          onTap: () {

                          },
                          child: Container(
                            // height: Get.height / 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: Get.width / 1.3,
                                child: const Text("D. Latin profesor ",
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
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: Get.width / 1.3,
                                child: const Text("Answer: D",
                                    style: TextStyle(
                                      color: Colors.white,
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
                        const Divider(
                          color: Colors.blue,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return AppBar(
      backgroundColor: colorAnimated.background,
      elevation: 0,
      title: Text(
        "AppBar Animate",
        style: TextStyle(
          color: colorAnimated.color,
        ),
      ),
      leading: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorAnimated.color,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: colorAnimated.color,
          ),
        ),
      ],
    );
  }
}
