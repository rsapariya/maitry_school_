// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/onbording.dart';
import 'package:schooolapp/techers/login/register.dart';
import 'package:http/http.dart' as http;
import '../../detabse.dart';
import '../../student/bottoms.dart';
import '../dashboard/bottombar/bottombar.dart';
import '../units/api.dart';
import '../units/storage.dart';
import 'forgot.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  final Connectivity _connectivity = Connectivity();
  final dbhelper = Databasehalper.instance;
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool npaas = true;
  bool loding = false;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height / 10,
                ),
                Center(
                  child: Image.asset(
                    "asstes/image/logo.png",
                    scale: 3,
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                const Text(
                  "Hey there,",
                  style: TextStyle(
                      fontFamily: "popins", color: Colors.black, fontSize: 22),
                ),
                const Text(
                  "Welcome back",
                  style: TextStyle(
                      fontFamily: "popins Medium",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: "popins", color: Colors.blue, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Phone number";
                    } else if (value.isPhoneNumber) {
                      return null;
                    } else {
                      return "Enter valid number";
                    }
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: phone,
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  decoration: buildInputDecoration(
                      hintText: "Enter Phone number",
                      lbltext: "Enter Phone number",
                      prifix: Image.asset(
                        'asstes/image/Placeholder (2).png',
                        scale: 2.5,
                      )),
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
                  controller: password,
                  autofocus: false,
                  obscureText: npaas,
                  decoration: buildInputDecoration(
                    hintText: "Password",
                    lbltext: "Password",
                    prifix: Image.asset(
                      'asstes/image/Lock.png',
                      scale: 2.5,
                    ),
                    surfix: InkWell(
                      onTap: () {
                        setState(() {
                          npaas = !npaas;
                        });
                      },
                      child: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const forget(),
                        transition: Transition.leftToRight);
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(
                        fontFamily: "popins",
                        fontSize: 14,
                        decoration: TextDecoration.underline),
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
                        loginapi();
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
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "popins"),
                              ),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                        fontFamily: "popins",
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const register(),
                            transition: Transition.leftToRight);
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: "popins",
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> checkInternetConnection() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
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

  loginapi() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.login));
    request.fields.addAll({
      'user_mobile': phone.text.toString(),
      'user_password': password.text.toString(),
      'user_token': token.toString()
    });
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          save('islogin', true);
          loding = false;
        });
        setState(() {
          save('logindata', val);
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
