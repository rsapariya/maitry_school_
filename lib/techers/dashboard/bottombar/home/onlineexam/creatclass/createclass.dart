import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/result/studentwise.dart';

import '../../../../../units/api.dart';
import '../allclass/allclasss.dart';
import '../onlineexam.dart';

class createclass extends StatefulWidget {
  const createclass({Key? key}) : super(key: key);

  @override
  State<createclass> createState() => _createclassState();
}

class _createclassState extends State<createclass> {
  @override
  void initState() {
    super.initState();
  }

  @override
  bool langauge = true;
  bool loding = false;
  TextEditingController classname = TextEditingController();
  String student = "13";
  var totel = 0;

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                        "Create class",
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
                  const Text(
                    "Class Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "popins"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (classname.text.toString().isEmpty) {
                        return "Enter class name";
                      }
                    },
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: classname,
                    autofocus: false,
                    decoration: buildInputDecoration(
                      hintText: "Enter The Class Name",
                      lbltext: "Enter The Class Name",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // const Text(
                  //   "Class Description",
                  //   style: TextStyle(
                  //       color: Colors.black, fontSize: 18, fontFamily: "popins"),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextFormField(
                  //   maxLines: 5,
                  //   style: const TextStyle(
                  //     fontFamily: "popins",
                  //   ),
                  //   // controller: code,
                  //   autofocus: false,
                  //   decoration: buildInputDecoration(
                  //     hintText: "Enter Description",
                  //     lbltext: "Enter Description",
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: loding == false
                        ? InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loding = true;
                                });
                                CreatAPI();
                              } else {}
                            },
                            child: Container(
                              height: Get.height / 22,
                              width: Get.width / 4,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                        fontFamily: 'popins',
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : CircularProgressIndicator(
                            color: Colors.blue,
                            strokeWidth: 3,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CreatAPI() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Creatclass));
    request.fields.addAll({"class_name": classname.text.toString()});
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {});
        Getclass();

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

  Getclass() async {
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.getclass));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          Class.clear();
          Classes.clear();
          val['Result'].forEach((e) {
            Class.add(e);
            Classes.add(e);
          });
        });
        setState(() {
          Get.off(() => allclass());
          loding = false;
        });
      } else {
      }
      // print('--->>$val');
    } else {
      print('--Getclass->>$val');
    }
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
      labelStyle: TextStyle(
        fontFamily: "popins",
        fontSize: 14,
      ),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          width: 1,
          color: Colors.blue,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
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
