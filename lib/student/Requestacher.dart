import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../techers/units/api.dart';
import 'bottoms.dart';

class Jointeacher extends StatefulWidget {
  const Jointeacher({Key? key}) : super(key: key);

  @override
  State<Jointeacher> createState() => _JointeacherState();
}

class _JointeacherState extends State<Jointeacher> {
  @override
  bool langauge = true;
  List notifi = ['11', '22'];
  int sselectedindex = 0;
  bool loding = false;
  TextEditingController numbre = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController fatherfname = TextEditingController();
  TextEditingController Std = TextEditingController();

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Join with Teacher",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins Medium",
                            fontSize: 18),
                      ),
                      InkWell(
                        child: SizedBox(
                          child: Container(
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: numbre,
                    validator: (value) {
                      if (numbre.text.isEmpty) {
                        return "Enter number";
                      } else if (numbre.text.isPhoneNumber) {
                        return null;
                      } else {
                        return "Enter valid number";
                      }
                    },
                    autofocus: false,
                    keyboardType: TextInputType.phone,
                    decoration: buildInputDecoration(
                        hintText: "Enter the Teacher’s Mobile Number",
                        // lbltext: "Enter Phone Number",
                        prifix: Image.asset(
                          'asstes/image/Placeholder (2).png',
                          scale: 2.5,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: surname,
                    validator: (value) {
                      if (surname.text.isEmpty) {
                        return "Enter username";
                      } else {}
                    },
                    autofocus: false,
                    decoration: buildInputDecoration(
                        hintText: "Enter username",
                        // lbltext: "Enter Phone Number",
                        prifix: Image.asset(
                          'asstes/image/Placeholder (2).png',
                          scale: 2.5,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: name,
                    validator: (value) {
                      if (name.text.isEmpty) {
                        return "Enter studentname";
                      } else {}
                    },
                    autofocus: false,
                    decoration: buildInputDecoration(
                        hintText: "Enter studentname",
                        // lbltext: "Enter Phone Number",
                        prifix: Image.asset(
                          'asstes/image/Placeholder (2).png',
                          scale: 2.5,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: fatherfname,
                    validator: (value) {
                      if (fatherfname.text.isEmpty) {
                        return "Enter fathername";
                      } else {}
                    },
                    autofocus: false,
                    decoration: buildInputDecoration(
                        hintText: "Enter fathername",
                        // lbltext: "Enter Phone Number",
                        prifix: Image.asset(
                          'asstes/image/Placeholder (2).png',
                          scale: 2.5,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: Std,
                    validator: (value) {
                      if (Std.text.isEmpty) {
                        return "Enter standard";
                      } else {}
                    },
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(
                        hintText: "Enter standard",
                        // lbltext: "Enter Phone Number",
                        prifix: Image.asset(
                          'asstes/image/Placeholder (2).png',
                          scale: 2.5,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loding = true;
                          });
                          Requesrtpi();
                        }
                      },
                      child: Center(
                        child: loding == false
                            ? Container(
                                height: Get.height / 20,
                                width: Get.width / 1.5,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: const Text(
                                    "Request to Join with Teacher",
                                    style: TextStyle(
                                        fontFamily: 'popins',
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.blue,
                              ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.blue.withOpacity(0.2),
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 4),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      child: const Center(
                        child: Icon(
                          Icons.done_all,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    const Text(
                      "Congratulations!",
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: "popins Bold",
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: const Text(
                        "Your request has send to your teacher.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "popins",
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 40,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Get.back();
                          Get.off(() => const bottoms(),
                              transition: Transition.leftToRight);
                        });
                      },
                      child: Container(
                        height: Get.height / 25,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  fontFamily: 'popins', color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Class'),
          content: SingleChildScrollView(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {});
                        Navigator.of(context).pop();
                        sselectedindex == index;
                      },
                      child: Row(
                        children: [
                          Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.blue)),
                              child: sselectedindex == index
                                  ? const Center(
                                      child: Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Colors.blue,
                                      ),
                                    )
                                  : const SizedBox()),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(notifi[index]),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.white,
                  );
                },
                itemCount: notifi.length),
          ),
        );
      },
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
          width: 1,        color: Colors.blue,
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

  Requesrtpi() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Sendrequest));
    request.fields.addAll({
      'mobile_number': numbre.text.toString(),
      'surname': surname.text.toString(),
      'studentname': name.text.toString(),
      'fathername': fatherfname.text.toString(),
      'standard': Std.text.toString(),
    });
    request.headers.addAll(headers);
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
        _dialogBuilder(context);
      } else {
        ApiWrapper.fluttertosat(val['message'].toString());
        setState(() {
          loding = false;
        });
      }
    } else {
      ApiWrapper.fluttertosat(val['message'].toString());
      setState(() {
        loding = false;
      });
    }
  }
}
