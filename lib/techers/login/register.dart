import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../student/bottoms.dart';
import '../dashboard/bottombar/bottombar.dart';

bool student = true;

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  bool npaas = true;
  bool cpaas = true;
  bool medium = true;
  bool group = true;
  String sub = "a";
  bool hide = true;
  bool turms = false;
  String gender = "male";
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                          student = true;
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
                                child: student == true
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
                              style:
                                  TextStyle(fontFamily: "popins", fontSize: 14),
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
                          student = false;
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
                                child: student == false
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
                              style:
                                  TextStyle(fontFamily: "popins", fontSize: 14),
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
                                      medium = true;
                                    });
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 6,
                                          child: const Text(
                                            "Medium",
                                            style:
                                                TextStyle(fontFamily: "popins"),
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
                                            child: medium == true
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
                                            "Student",
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
                                      medium = false;
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
                                            child: medium == false
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
                                            "Teacher",
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
                                      group = true;
                                    });
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 6,
                                          child: const Text(
                                            "Group",
                                            style:
                                                TextStyle(fontFamily: "popins"),
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
                                            child: group == true
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
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      group = false;
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
                                            child: group == false
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
                                const SizedBox(
                                  width: 15,
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                // controller: code,
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
                                color:
                                    turms == true ? Colors.blue : Colors.grey),
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
                onTap: () {
                  student == false
                      ? Get.to(() => const bottomt())
                      : Get.to(() => const bottoms());
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
                        "Register",
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
