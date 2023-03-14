import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/onlineexam/allclass/studentlist.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/onlineexam/onlineexam.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/techers/dashboard/bottombar/home/result/studentwise.dart';
import '../../../../../units/api.dart';
import '../../../../../units/storage.dart';
import '../../home.dart';

class allclass extends StatefulWidget {
  const allclass({Key? key}) : super(key: key);

  @override
  State<allclass> createState() => _allclassState();
}

class _allclassState extends State<allclass> {
  @override
  bool langauge = true;
  bool loding = false;
  String student = "13";
  var totel = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 30, vertical: Get.height / 80),
            child: RefreshIndicator(
              onRefresh: regresher,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        "All Class",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins Medium",
                            fontSize: 18),
                      ),
                      InkWell(
                        child: SizedBox(
                          child: Container(
                            height: Get.height / 20,
                            width: Get.width / 9,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  loding == false
                      ? Class.isNotEmpty
                          ? SizedBox(
                              height: Get.height / 1.2,
                              child: ListView.builder(
                                // controller: controller,
                                itemCount: Class.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width / 40),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              save(
                                                  'classid',
                                                  Class[index]
                                                      ["student_class_id"]);
                                            });
                                            Get.to(() => studentlsi(),
                                                transition:
                                                    Transition.leftToRight);
                                          },
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Class[index]
                                                        ["student_class_name"],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "popins Medium",
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    Class[index][
                                                        "student_class_created"],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "popins",
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    save(
                                                        'Did',
                                                        Class[index][
                                                            'student_class_id']);
                                                  });
                                                  dialogBuilder(context);
                                                },
                                                child: Icon(
                                                  Icons.delete_outline,
                                                  size: 25,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: Get.height / 2.2),
                              child: const Center(
                                child: Text(
                                  "Data not found.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "popins Medium",
                                      fontSize: 18),
                                ),
                              ),
                            )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: Get.height / 2.2),
                            child: CircularProgressIndicator(
                              color: Colors.blue,strokeWidth:3,
                            ),
                          ),
                        ),
                ],
              ),
            )),
      ),
    );
  }

  Future<void> regresher() async {
    Getclass();
  }

  DetetAPI() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppUrl.Deleteclass + getdata.read('Did').toString()));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {});
        ApiWrapper.fluttertosat(val['message'].toString());
        Getclass();
      } else {
        setState(() {
          loding = false;
        });
      }
    } else {
      setState(() {
        loding = false;
      });
      ApiWrapper.fluttertosat(val['message'].toString());
    }
  }

  GetStudentbyclass() async {
    var request =
        http.MultipartRequest('GET', Uri.parse(AppUrl.getstudntbyclass));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          classtudent.clear();
          val['Result'].forEach((e) {
            classtudent.add(e);
          });
        });
        setState(() {});
      } else {
        setState(() {
          classtudent.clear();
        });
      }
    } else {
      setState(() {});
    }
  }

  Getclass() async {
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.getclass));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          Classes.clear();
          Class.clear();
          val['Result'].forEach((e) {
            Class.add(e);
            Classes.add(e);
          });
        });
        setState(() {
          loding = false;
        });
      } else {
        setState(() {
          Class.clear();
          Classes.clear();
          loding = false;
        });
      }
      // print('--->>$val');
    } else {
      setState(() {
        loding = false;
      });
    }
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.blue.withOpacity(0.2),
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 3),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins medium",
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: Get.height / 40,
                    ),
                    Text(
                      "Are you sure you want to Delete this Class ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins",
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: Get.height / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Get.back();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width / 20,
                                    vertical: Get.height / 120),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontFamily: 'popins',
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              loding = true;
                            });
                            Get.back();
                            DetetAPI();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width / 20,
                                    vertical: Get.height / 120),
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                      fontFamily: 'popins', color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ));
      },
    );
  }

  InputDecoration buildInputDecoration({
    String? hintText,
    prifix,
    surfix,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: prifix,
      suffixIcon: surfix,
      hintText: hintText,
      hintStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
