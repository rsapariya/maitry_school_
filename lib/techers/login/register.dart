// ignore_for_file: equal_keys_in_map

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/onbording.dart';
import 'package:schooolapp/techers/login/otp.dart';
import 'package:schooolapp/techers/units/storage.dart';

import '../units/api.dart';

String group = "A";
bool student = true;
String Medium = "gujarati";

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController schoolname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController taluko = TextEditingController();

  @override
  String OTPnum = '';
  bool npaas = true;
  bool cpaas = true;

  String sub = "a";
  bool hide = true;
  bool turms = false;
  String gender = "male";
  String usertype = "Student";
  bool loding = false;

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
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
                  "Create an Account",
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
                  "Register",
                  style: TextStyle(
                      fontFamily: "popins", color: Colors.blue, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: fullname,
                  validator: (value) {
                    if (fullname.text.isEmpty) {
                      return "Enter Full Name";
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  autofocus: false,
                  decoration: buildInputDecoration(
                    hintText: "Enter Your Full Name",
                    prifix: Image.asset(
                      'asstes/image/Placeholder.png',
                      scale: 2.5,
                    ),
                    lbltext: "Enter Your Full Name",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      GetUtils.isPhoneNumber(value!) || GetUtils.isNull(value)
                          ? null
                          : "Please Enter valid number",
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: phonenumber,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "Enter Phone Number",
                      lbltext: "Enter Phone Number",
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
                    if (cpassword.text.isEmpty) {
                      return "Enter password";
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: password,
                  autofocus: false,
                  obscureText: npaas,
                  decoration: buildInputDecoration(
                      hintText: "Your Password",
                      surfix: InkWell(
                        onTap: () {
                          setState(() {
                            npaas = !npaas;
                          });
                        },
                        child: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      lbltext: "Your Password",
                      prifix: Image.asset(
                        'asstes/image/Lock.png',
                        scale: 2.5,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (password.text.isEmpty) {
                      return "Enter password";
                    } else if (value != password.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: cpassword,
                  autofocus: false,
                  obscureText: cpaas,
                  decoration: buildInputDecoration(
                      hintText: "Your Password",
                      surfix: InkWell(
                        onTap: () {
                          setState(() {
                            cpaas = !cpaas;
                          });
                        },
                        child: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      lbltext: "Your Password",
                      prifix: Image.asset(
                        'asstes/image/Lock.png',
                        scale: 2.5,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "I am a",
                    style: TextStyle(fontFamily: "popins", fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            usertype = 'Student';
                            hide = true;
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.blue)),
                                  child: usertype == 'Student'
                                      ? const Center(
                                          child: Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Colors.blue,
                                          ),
                                        )
                                      : const SizedBox()),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Student",
                                style: TextStyle(
                                    fontFamily: "popins", fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            usertype = 'Teacher';
                            hide = false;
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.blue)),
                                  child: usertype == 'Teacher'
                                      ? const Center(
                                          child: Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Colors.blue,
                                          ),
                                        )
                                      : const SizedBox()),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Teacher",
                                style: TextStyle(
                                    fontFamily: "popins", fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                hide
                    ? Container(
                        height: Get.height / 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Medium == 'gujarati';
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width / 6,
                                            child: const Text(
                                              "Medium",
                                              style: TextStyle(
                                                  fontFamily: "popins"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: Medium == 'gujarati'
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 6,
                                            child: const Text(
                                              "Gujarati",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Medium = 'english';
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.blue)),
                                            child: Medium == 'english'
                                                ? const Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 6,
                                            child: const Text(
                                              "English",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        group = "A";
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width / 6,
                                            child: const Text(
                                              "Group",
                                              style: TextStyle(
                                                  fontFamily: "popins"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: group == "A"
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 6,
                                            child: const Text(
                                              "A",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        group = "B";
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: group == "B"
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 6,
                                            child: const Text(
                                              "B",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        group = "AB";
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: group == "AB"
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 6,
                                            child: const Text(
                                              "AB",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: Get.height / 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sub = "a";
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: sub == "a"
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 5,
                                            child: const Text(
                                              "Biology",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sub = "b";
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: sub == "b"
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 5,
                                            child: const Text(
                                              "Physics",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sub = "c";
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: sub == "c"
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 5,
                                            child: const Text(
                                              "Chemistry",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sub = "d";
                                      });
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.blue)),
                                              child: sub == "d"
                                                  ? const Center(
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 10,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 5,
                                            child: const Text(
                                              "Maths",
                                              style: TextStyle(
                                                  fontFamily: "popins",
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter school';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: schoolname,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "School name",
                      lbltext: "School name",
                      prifix: Image.asset(
                        'asstes/image/ep_school.png',
                        scale: 2.5,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter city';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: city,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "City/Village",
                      lbltext: "City/Village",
                      prifix: Image.asset(
                        'asstes/image/Home.png',
                        scale: 2.5,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter district';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: district,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "District",
                      lbltext: "District",
                      prifix: Image.asset(
                        'asstes/image/Location.png',
                        scale: 2.5,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: taluko,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "Taluka",
                      lbltext: "Taluka",
                      prifix: Image.asset(
                        'asstes/image/Location.png',
                        scale: 2.5,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          turms = !turms;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: turms == true
                                      ? Colors.blue
                                      : Colors.grey),
                              color: turms == true ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child: turms == true
                              ? const Center(
                                  child: Icon(
                                    Icons.done,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: Get.width / 1.3,
                      child: const Text(
                        "By Countinuing you accept our Privecy policy and turms of use.",
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "popins",
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                InkWell(
                  onTap: () async {
                    if (loding == false) {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          if (phonenumber.text.length == 10) {
                            OTPnum = "+91" + phonenumber.text.toString();
                          } else {
                            OTPnum = phonenumber.text.toString();
                          }
                          var data = {
                            "fullname": fullname.text.toString(),
                            "phonenumber": OTPnum.toString(),
                            "password": password.text.toString(),
                            "cpassword": cpassword.text.toString(),
                            "cpassword": cpassword.text.toString(),
                            "schoolname": schoolname.text.toString(),
                            "city": city.text.toString(),
                            "district": district.text.toString(),
                            "taluko": taluko.text.toString(),
                            "usertype": usertype.toString(),
                            "token": token.toString(),
                          };
                          save('Register', data);
                          loding = true;
                        });
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: OTPnum,
                          verificationCompleted: (phoneAuthCredential) {},
                          verificationFailed: (error) {
                            setState(() {
                              loding = false;
                            });
                            ApiWrapper.fluttertosat(error.toString());
                            ApiWrapper.fluttertosat('Chek Number');
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            ApiWrapper.fluttertosat('Code sent.');
                            setState(() {
                              save("verification", verificationId);
                              loding = false;
                            });
                            Get.to(() => verification());
                          },
                          codeAutoRetrievalTimeout: (verificationId) {},
                        );
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
                                "Register",
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
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Allredy have an account?",
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
                        "Login",
                        style: TextStyle(
                          fontFamily: "popins",
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
              ],
            ),
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
