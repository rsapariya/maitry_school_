import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/techers/login/mainscreen.dart';
import '../units/api.dart';

class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  bool loding = false;
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: Get.height / 18,
              width: Get.width / 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.blue),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Forgot password",
          style: TextStyle(fontFamily: "popins", color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height / 15,
                  ),
                  const Text(
                    "Enter your Phone number",
                    style: TextStyle(
                      fontFamily: "popins Medium",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Number';
                      } else if (value.isPhoneNumber) {
                        return null;
                      }
                      return 'Enter valid Number!';
                    },
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: number,
                    autofocus: false,
                    decoration: buildInputDecoration(
                        hintText: "Phone number",
                        lbltext: "Phone number",
                        icon: Icons.call),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Back to sign in",
                      style: TextStyle(
                        fontFamily: "popins",
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  loding == false
                      ? InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loding = true;
                              });
                              Newpass();
                            }
                          },
                          child: Container(
                            height: Get.height / 15,
                            width: Get.width / 1.8,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(40)),
                            child: Row(
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
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "popins"),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const CircularProgressIndicator(
                          color: Colors.blue,
                          strokeWidth: 3,
                        ),
                  SizedBox(
                    height: Get.height / 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                          fontFamily: "popins",
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: "popins",
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  Newpass() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Forgot));
    request.fields.addAll({
      'mobile_number': number.text.toString(),
    });
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
          loding = false;
        });
        ApiWrapper.fluttertosat(val['message'].toString());
        Get.off(() => mainscreen(), transition: Transition.leftToRight);
      } else {
        setState(() {
          loding = false;
        });
        ApiWrapper.fluttertosat(val['message'].toString());
      }
    } else {
      setState(() {
        loding = false;
      });
      ApiWrapper.fluttertosat(val['message'].toString());
    }
  }

  InputDecoration buildInputDecoration({
    String? hintText,
    IconData? icon,
    surfix,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blue),
      suffix: surfix,
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
