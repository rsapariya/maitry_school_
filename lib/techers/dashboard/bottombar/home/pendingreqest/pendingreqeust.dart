// ignore_for_file: camel_case_types, unrelated_type_equality_checks, non_constant_identifier_names, sized_box_for_whitespace, override_on_non_overriding_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/techers/units/storage.dart';

import '../../../../login/mainscreen.dart';
import '../../../../units/api.dart';
import '../onlineexam/onlineexam.dart';

List requestlist = [];

class pendingreqest extends StatefulWidget {
  const pendingreqest({Key? key}) : super(key: key);

  @override
  State<pendingreqest> createState() => _pendingreqestState();
}

class _pendingreqestState extends State<pendingreqest> {
  bool langauge = true;
  int sselectedindex = 0;
  bool loding = false;

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
                horizontal: Get.width / 30, vertical: Get.height / 80),
            child: RefreshIndicator(
              onRefresh: regresher,
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
                          height: 40,
                          width: 40,
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
                        "Student Request",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins Medium",
                            fontSize: 18),
                      ),
                      InkWell(
                        child: SizedBox(
                          child: Container(
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  loding == false
                      ? requestlist.isEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: Get.height / 2.3),
                              child: const Center(
                                child: Text(
                                  'Request not found',
                                  style: TextStyle(
                                      fontFamily: 'popins medium',
                                      color: Colors.blue,
                                      fontSize: 18),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: requestlist.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height / 100),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {});
                                        // _showMyDialog();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Get.width / 40,
                                              vertical: Get.height / 80),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width / 1.5,
                                                child: Text(
                                                  requestlist[index]
                                                      ['user_name'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          "popins medium"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width / 1.5,
                                                child: Text(
                                                  requestlist[index]
                                                      ['user_mobile'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "popins"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width / 1.5,
                                                child: Text(
                                                  "Std. : ${requestlist[index]['standard']}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "popins"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width / 1.5,
                                                child: Text(
                                                  requestlist[index]
                                                      ['request_msg'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "popins"),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {});
                                                      save('Rid',
                                                          requestlist[index]);
                                                      classdailog(context);
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .blue)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      Get.width /
                                                                          12,
                                                                  vertical:
                                                                      Get.height /
                                                                          120),
                                                          child: const Text(
                                                            'Accept',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    "popins medium"),
                                                          ),
                                                        )),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        save('Rid',
                                                            requestlist[index]);
                                                      });
                                                      dialogBuilder(context);
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      Get.width /
                                                                          12,
                                                                  vertical:
                                                                      Get.height /
                                                                          120),
                                                          child: const Text(
                                                            'Cancel',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    "popins medium"),
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                      : Padding(
                          padding: EdgeInsets.only(top: Get.height / 2.2),
                          child: const CircularProgressIndicator(
                            color: Colors.blue,
                            strokeWidth: 3,
                          ),
                        ),
                ],
              ),
            )),
      ),
    );
  }

  Future<void> regresher() async {
    getallreq();
  }

  getallreq() async {
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.getrequest));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          requestlist.clear();
          val['Result'].forEach((e) {
            requestlist.add(e);
          });
        });
        setState(() {
          loding = false;
        });
      } else {

        setState(() {
          loding = false;
          requestlist.clear();
        });
      }
      // print('--->>$val');
    } else {

      setState(() {
        loding = false;
        requestlist.clear();
      });
    }
  }

  Cancelrequest() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.decline));
    request.fields.addAll({
      "request_id": getdata.read('Rid')['request_id'].toString(),
      "student_id": getdata.read('Rid')['ref_student_id'].toString()
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'].toString() == true) {
        setState(() {});
        getallreq();
        ApiWrapper.fluttertosat(val['message'].toString());
      } else {
        getallreq();
        ApiWrapper.fluttertosat(val['message'].toString());
        setState(() {
          loding = false;
        });
      }
    } else {
      ApiWrapper.fluttertosat(val['message'].toString());
      setState(() {
        loding = false;
      });
    }
  }

  acceptrequest() async {
    var request =
        http.MultipartRequest('POST', Uri.parse(AppUrl.Acceptrequets));
    request.fields.addAll({
      "request_id": getdata.read('Rid')['request_id'].toString(),
      "student_id": getdata.read('Rid')['ref_student_id'].toString()
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {});

        getallreq();
        ApiWrapper.fluttertosat(val['message'].toString());
      } else {
        ApiWrapper.fluttertosat(val['message'].toString());
        setState(() {
          loding = false;
        });
      }
    } else {
      ApiWrapper.fluttertosat(val['message'].toString());
      setState(() {
        loding = false;
      });
    }
  }

  Addinclass() async {
    var request =
        http.MultipartRequest('POST', Uri.parse(AppUrl.Acceptrequets));
    request.fields.addAll({
      "request_id": getdata.read('Rid')['request_id'].toString(),
      "student_id": getdata.read('Rid')['ref_student_id'].toString(),
      "class_id": getdata.read('classid').toString(),
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {});
        acceptrequest();

        ApiWrapper.fluttertosat(val['message'].toString());
      } else {
        ApiWrapper.fluttertosat(val['message'].toString());

        setState(() {
          loding = false;
        });
      }
    } else {

      ApiWrapper.fluttertosat(val['message'].toString());
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Warning",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "popins medium",
                      fontSize: 20),
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                const Text(
                  "Are you sure you want to Cancel this Request ?",
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
                            child: const Text(
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
                          Cancelrequest();
                          Get.back();
                        });
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
                            child: const Text(
                              "Yes i'am sure",
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
              ),
            ));
      },
    );
  }

  Future<void> classdailog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.blue.withOpacity(0.2),
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 4),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select class",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "popins medium",
                      fontSize: 20),
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                Class.isNotEmpty
                    ? SizedBox(
                        height: Get.height / 3.5,
                        child: ListView.builder(
                          // controller: controller,
                          itemCount: Class.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width / 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        loding = true;
                                        save(
                                            'classid',
                                            Class[index]
                                                ['student_class_id']);
                                        Addinclass();
                                      });
                                      Get.back();
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
                                          ],
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.blue,
                                    thickness: 1,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: Get.height / 8),
                        child: const Center(
                          child: Text(
                            "Class not found",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "popins Medium",
                                fontSize: 18),
                          ),
                        ),
                      ),
              ],
                ),
              ),
            ));
      },
    );
  }
}
