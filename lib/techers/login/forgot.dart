import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp.dart';


class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  @override
  Widget build(BuildContext context) {
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
              InkWell(
                onTap: () {
                  Get.to(() => const verification(),transition:Transition.leftToRight);
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
