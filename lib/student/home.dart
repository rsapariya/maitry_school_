// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:schooolapp/student/prectice/selectch.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/student/viewmacq/onlineexam.dart';
import 'package:schooolapp/techers/units/storage.dart';
import '../techers/dashboard/bottombar/home/notification.dart';
import '../techers/dashboard/bottombar/home/result/studentwise.dart';
import '../techers/units/api.dart';
import 'Materials.dart';
import 'Onlinetest/test.dart';
import 'gujcetpaper.dart';

List subscribplanse = [];
List ExamList = [];
List Alltest = [];
String groupid = "";
String Sunject = "";

class homes extends StatefulWidget {
  const homes({Key? key}) : super(key: key);
  @override
  State<homes> createState() => _homesState();
}

class _homesState extends State<homes> {
  @override
  void initState() {
    GetOfer();
    Getexam();
    Alltestapi();
    getsubsribtionS();
    super.initState();
  }

  String selectedItem = '11th';
  String selectedItem2 = 'Biology';
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  child: Text(
                                    '12th',
                                    style: TextStyle(color: Colors.blue),
                                  ),
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

                                  if (selectedItem == "11th") {
                                    groupid = '1';
                                  } else if (selectedItem == "12th") {
                                    groupid = '2';
                                  }
                                });
                                print(groupid);
                              },
                            ),
                          ),
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
                Stack(
                  children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                          ),
                        ],
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
                    Get.to(() => const onlinetest(),
                        transition: Transition.leftToRight);
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
                        ),
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
          subscribplanse.clear();
          val['Result'].forEach((e) {
            subscribplanse.add(e);
          });
        });
        setState(() {});
      } else {}
    } else {}
  }

  GetOfer() async {
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.getoffers));
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
          save('offers', val);
        });
        setState(() {});
      } else {}
    } else {}
  }

  Getexam() async {
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(AppUrl.getexam +
            getdata.read('logindata')['Result']['user_id'].toString()));
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
          save('offers', val);
          ExamList.clear();
          val['Result'].forEach((e) {
            ExamList.add(e);
          });
        });
        setState(() {});
      } else {}
    } else {}
  }

  drop() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'Select Class',
                style: TextStyle(
                    fontSize: 14, color: Colors.black, fontFamily: 'popins'),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: Classes.map((Map map) => DropdownMenuItem<String>(
              value: map["student_class_id"].toString(),
              child: Text(
                map['student_class_name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'popins',
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )).toList(),
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value as String;
          });
        },
        buttonStyleData: const ButtonStyleData(
          height: 50,
          width: 160,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.blue,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: null,
          maxHeight: 200,
          elevation: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
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
