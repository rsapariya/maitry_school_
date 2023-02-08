import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class newpass extends StatefulWidget {
  const newpass({Key? key}) : super(key: key);

  @override
  State<newpass> createState() => _newpassState();
}

class _newpassState extends State<newpass> {
  @override
  bool pass = true;
  bool npass = true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "New password",
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
                "Enter new password",
                style: TextStyle(
                  fontFamily: "popins",
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
                onTap: () {
                  setState(() {
                    pass = !pass;
                  });
                },
                obscureText: pass,
                decoration: buildInputDecoration(
                    hintText: "Password",
                    lbltext: "Password",
                    surfix: const Icon(Icons.remove_red_eye_outlined),
                    icon: Icons.lock_outline),
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
                onTap: () {
                  setState(() {
                    npass = !npass;
                  });
                },
                obscureText: npass,
                decoration: buildInputDecoration(
                    hintText: "Password",
                    lbltext: "Password",
                    surfix: const Icon(Icons.remove_red_eye_outlined),
                    icon: Icons.lock_outline),
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
                onTap: () {},
                child: Container(
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
    void Function()? onTap,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blue),
      suffixIcon: InkWell(onTap: onTap, child: surfix),
      hintText: hintText,
      hintStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
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
