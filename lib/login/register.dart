import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/dashboard/bottombar/bottombar.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  bool npaas = true;
  bool cpaas = true;
  bool student = true;
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
              Text(
                "Hey there,",
                style: TextStyle(
                    fontFamily: "popins", color: Colors.black, fontSize: 22),
              ),
              Text(
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
              Text(
                "Register",
                style: TextStyle(
                    fontFamily: "popins", color: Colors.blue, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
                      child: Icon(Icons.remove_red_eye_outlined),
                    ),
                    lbltext: "Your Password",
                    prifix: Image.asset(
                      'asstes/image/Lock.png',
                      scale: 2.5,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
                      child: Icon(Icons.remove_red_eye_outlined),
                    ),
                    lbltext: "Your Password",
                    prifix: Image.asset(
                      'asstes/image/Lock.png',
                      scale: 2.5,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "I am a",
                  style: TextStyle(fontFamily: "popins", fontSize: 18),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
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
                                    ? Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.blue,
                                        ),
                                      )
                                    : SizedBox()),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Student",
                              style:
                                  TextStyle(fontFamily: "popins", fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
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
                                    ? Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.blue,
                                        ),
                                      )
                                    : SizedBox()),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Teacher",
                              style:
                                  TextStyle(fontFamily: "popins", fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
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
                        padding: EdgeInsets.only(left: 10),
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
                                          child: Text(
                                            "Medium",
                                            style:
                                                TextStyle(fontFamily: "popins"),
                                          ),
                                        ),
                                        SizedBox(
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 6,
                                          child: Text(
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
                                SizedBox(
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 6,
                                          child: Text(
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
                                SizedBox(
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
                                          child: Text(
                                            "Group",
                                            style:
                                                TextStyle(fontFamily: "popins"),
                                          ),
                                        ),
                                        SizedBox(
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 6,
                                          child: Text(
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
                                SizedBox(
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 6,
                                          child: Text(
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
                                SizedBox(
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
                        padding: EdgeInsets.only(left: 10),
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 5,
                                          child: Text(
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
                                SizedBox(
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 5,
                                          child: Text(
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
                                SizedBox(
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 5,
                                          child: Text(
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
                                SizedBox(
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
                                                ? Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 10,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox()),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width / 5,
                                          child: Text(
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
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
              SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(
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
              SizedBox(
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
                      padding: EdgeInsets.only(top: 8),
                      child: Container(
                        height: 15,
                        width: 15,
                        child: turms == true
                            ? Center(
                                child: Icon(
                                  Icons.done,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox(),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    turms == true ? Colors.blue : Colors.grey),
                            color: turms == true ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: Get.width / 1.3,
                    child: Text(
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
                  Get.to(() => bottom());
                },
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
                      Text(
                        "Register",
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
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
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
                    child: Text(
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
      hintStyle: TextStyle(
        fontFamily: "popins",fontSize: 14
      ),
      labelStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
          width:1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
