// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../login/mainscreen.dart';
import '../../../units/api.dart';

class changepasswoed extends StatefulWidget {
  const changepasswoed({Key? key}) : super(key: key);
  @override
  State<changepasswoed> createState() => _changepasswoedState();
}

class _changepasswoedState extends State<changepasswoed> {
  TextEditingController Oldpass = TextEditingController();
  TextEditingController Npass = TextEditingController();
  TextEditingController Cpass = TextEditingController();
  bool one = true;
  bool two = true;
  bool three = true;
  bool loding = false;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 80),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Change password",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins Medium",
                          fontSize: 18),
                    ),
                    const InkWell(
                      child: SizedBox(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password!";
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: Oldpass,
                  autofocus: false,
                  obscureText: one,
                  decoration: buildInputDecoration(
                    hintText: "Old password",
                    lbltext: "Old password",
                    prifix: Image.asset(
                      'asstes/image/Lock.png',
                      scale: 2.5,
                    ),
                    surfix: InkWell(
                      onTap: () {
                        setState(() {
                          one = !one;
                        });
                      },
                      child: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password!";
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: Npass,
                  autofocus: false,
                  obscureText: two,
                  decoration: buildInputDecoration(
                    hintText: "New password",
                    lbltext: "New password",
                    prifix: Image.asset(
                      'asstes/image/Lock.png',
                      scale: 2.5,
                    ),
                    surfix: InkWell(
                      onTap: () {
                        setState(() {
                          two = !two;
                        });
                      },
                      child: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password!";
                    } else if (Cpass.text == Npass.text) {
                      return null;
                    } else {
                      return "Password don't metch";
                    }
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: Cpass,
                  autofocus: false,
                  obscureText: three,
                  decoration: buildInputDecoration(
                    hintText: "Confirm password",
                    lbltext: "Confirm password",
                    prifix: Image.asset(
                      'asstes/image/Lock.png',
                      scale: 2.5,
                    ),
                    surfix: InkWell(
                      onTap: () {
                        setState(() {
                          three = !three;
                        });
                      },
                      child: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () async {
                    if (loding == false) {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loding = true;
                        });
                        changeAPI();
                      }
                    }
                  },
                  child: Container(
                    height: Get.height / 15,
                    width: Get.width / 1.8,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(40)),
                    child: loding == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "asstes/image/Login.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: Get.width / 40,
                              ),
                              const Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "popins"),
                              ),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth:3,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
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
      labelStyle: const TextStyle(
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
        borderSide: const BorderSide(
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

  changeAPI() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.chagepass));
    request.fields.addAll({
      'old_password': Oldpass.text.toString(),
      'new_password': Npass.text.toString(),
      'confirm_password': Cpass.text.toString()
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);
    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          loding = false;
        });

        ApiWrapper.fluttertosat(val['message'].toString());
      } else {
        setState(() {
          loding = false;
        });
        ApiWrapper.fluttertosat(val['message'].toString());
      }
      // print('--->>$val');
    } else {
      setState(() {
        loding = false;
      });
      ApiWrapper.fluttertosat(val['message'].toString());
    }
  }
}
