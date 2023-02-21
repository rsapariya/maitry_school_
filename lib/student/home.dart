// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/prectice/selectch.dart';
import 'package:http/http.dart' as http;
import '../techers/dashboard/bottombar/home/notification.dart';
import '../techers/units/api.dart';
import 'Materials.dart';
import 'gujcetpaper.dart';
import 'onlineexam/onlineexam.dart';

List subscribplanse = [];

class homes extends StatefulWidget {
  const homes({Key? key}) : super(key: key);
  @override
  State<homes> createState() => _homesState();
}

class _homesState extends State<homes> {
  @override
  void initState() {
    getsubsribtionS();
    super.initState();
  }

  String selectedItem = '11th';
  String selectedItem2 = 'Biology';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: Get.height / 25,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButton<String>(
                                  value: selectedItem,
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(10),
                                  items: const [
                                    DropdownMenuItem(
                                      value: '11th',
                                      child: Text(
                                        '11th',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: '12th',
                                      child: Text('12th',
                                          style: TextStyle(color: Colors.blue)),
                                    ),
                                  ],
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.blue,
                                  ),
                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedItem = value!;
                                    });
                                  })),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: Get.height / 25,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButton<String>(
                                  value: selectedItem2,
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(10),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Biology',
                                      child: Text(
                                        'Biology',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Physics',
                                      child: Text('Physics',
                                          style: TextStyle(color: Colors.blue)),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Chemistry',
                                      child: Text('Chemistry',
                                          style: TextStyle(color: Colors.blue)),
                                    ),
                                  ],
                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.blue,
                                  ),
                                  onChanged: (value2) {
                                    setState(() {
                                      selectedItem2 = value2!;
                                    });
                                  })),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => const notification(),
                            transition: Transition.leftToRight);
                      },
                      child: Container(
                        height: Get.height / 20,
                        width: Get.width / 9,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                            "asstes/image/Bell-Icon.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: Get.height / 4.5,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Get.width / 1.85),
                          child: SizedBox(
                            height: Get.height / 2,
                            width: Get.width / 1.5,
                            child: Image.asset(
                              "asstes/image/Group 10349.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Image.asset(
                          "asstes/image/Mask group (1).png",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Lorem ipsum doller\nsit amet",
                                style: TextStyle(
                                    fontFamily: 'popins',
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: Get.height / 50,
                              ),
                              Container(
                                height: Get.height / 25,
                                width: Get.width / 3.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Read more",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const Gujcetpaper(),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/pdf 1.png',
                                scale: 3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Guj Board/ Neet/jee/Gujcet Paper',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const selectchapters(),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/exam 2.png',
                                scale: 3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'View MCQ',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const Materials(),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/pdf 1.png',
                                scale: 3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Short Material',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const precticechapter(),
                              transition: Transition.leftToRight);
                        },
                        child: Container(
                          height: Get.height / 6,
                          decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asstes/image/exam 2.png',
                                scale: 3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Practice Test',
                                style: TextStyle(
                                    fontFamily: 'popins', fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // Get.to(() => const pendingreqest());
                  },
                  child: Container(
                    height: Get.height / 6,
                    width: Get.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asstes/image/profile/patient.png',
                          scale: 12,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Online Test',
                            style:
                                TextStyle(fontFamily: 'popins', fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getsubsribtionS() async {
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.getsubscribeS));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          subscribplanse.clear();
          val['Result'].forEach((e) {
            subscribplanse.add(e);
          });
        });
        print('--000000000000000000000000000000000->>$val');
        setState(() {});
      } else {
        print('--0000->>$val');
      }
      // print('--->>$val');
    } else {
      print('--00000->>$val');
    }
  }
}
