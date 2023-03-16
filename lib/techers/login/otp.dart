// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:pinput/pinput.dart';
import 'package:schooolapp/techers/units/storage.dart';
import 'package:http/http.dart' as http;
import '../../student/bottoms.dart';
import '../dashboard/bottombar/bottombar.dart';
import '../units/api.dart';

class verification extends StatefulWidget {
  const verification({Key? key}) : super(key: key);

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  var SMS = "";
  bool loding = false;



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Verification",
          style: TextStyle(fontFamily: "popins", color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 15,
              ),
              const Text(
                "We have sent a 6 digit OTP to",
                style: TextStyle(
                  fontFamily: "popins",
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getdata.read('Register')['phonenumber'] ?? "",
                    style: const TextStyle(
                      fontFamily: "popins Medium",
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      " Edit number",
                      style: TextStyle(
                        fontFamily: "popins Medium",
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              Pinput(
                length: 6,
                focusedPinTheme: PinTheme(
                  width: Get.width / 7,
                  height: Get.height / 15,
                ),
                showCursor: true,
                onChanged: (value) {
                  setState(() {
                    SMS = value.toString();
                  });
                },
                onCompleted: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "If you don't recive code",
                    style: TextStyle(
                      fontFamily: "popins",
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Recend",
                      style: TextStyle(
                        fontFamily: "popins",
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: getdata.read('verification'),
                            smsCode: SMS.toString());
                    await auth.signInWithCredential(credential);
                    setState(() {
                      loding = true;
                    });

                    Registerapi();
                  } catch (e) {
                    ApiWrapper.fluttertosat('Wrong OTP!!');
                  }
                },
                child: Container(
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
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "popins"),
                            ),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ),
                  height: Get.height / 15,
                  width: Get.width / 1.8,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              SizedBox(
                height: Get.height / 10,
              ),
            ],
          ),
        ),
      ),
    );
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

  Registerapi() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Signup));
    request.fields.addAll({
      'user_name': getdata.read('Register')['fullname'],
      'user_mobile': getdata.read('Register')['phonenumber'],
      'user_type': getdata.read('Register')['usertype'],
      'user_password': getdata.read('Register')['password'],
      'user_standard_id': '1',
      'user_school_name': getdata.read('Register')['schoolname'],
      'user_token': getdata.read('Register')['token'],
      'user_reference_number': '',
      "user_taluko": getdata.read('Register')['taluko'],
      "user_gam": getdata.read('Register')['district'],
      "user_jillo": getdata.read('Register')['city'],
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
          save('islogin', true);
        });
        ApiWrapper.fluttertosat(val['message'].toString());
        val['Result']['user_type'] == 'Teacher'
            ? Get.offAll(() => const bottomt(),
                transition: Transition.leftToRight)
            : Get.offAll(() => const bottoms(),
                transition: Transition.leftToRight);
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
}

class v {
  List a = [
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
    {
      'a': 'asddd',
      'b': 'ss',
      'c': 'fev',
      'd': 'ss',
      'e': 'asvetbddd',
    },
  ];
}
