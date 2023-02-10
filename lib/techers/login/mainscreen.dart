import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/login/register.dart';

import '../dashboard/bottombar/bottombar.dart';
import 'forgot.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false,
                decoration: buildInputDecoration(
                    hintText: "Phone number",
                    prifix: Image.asset(
                      'asstes/image/Placeholder (2).png',
                      scale: 2.5,
                    ),
                    lbltext: "Phone number",
                    surfix: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.red,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
                autofocus: false,

                decoration: buildInputDecoration(
                  hintText: "Password",
                  lbltext: "Password",
                  prifix: Image.asset(
                    'asstes/image/Lock.png',
                    scale: 2.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const forget(),transition:Transition.leftToRight);
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
                onTap: () {
                  Get.to(() => const bottomt(),transition:Transition.leftToRight);
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
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "popins"),
                      ),
                    ],
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
                      Get.to(() => const register(),transition:Transition.leftToRight);
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
      suffix: surfix,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontFamily: "popins",fontSize: 14
      ),
      labelStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
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
