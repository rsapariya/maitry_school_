import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../techers/units/storage.dart';

class Editpro extends StatefulWidget {
  const Editpro({Key? key}) : super(key: key);

  @override
  State<Editpro> createState() => _EditproState();
}

class _EditproState extends State<Editpro> {
  TextEditingController fullname = TextEditingController(
      text: getdata.read('logindata')['Result']['user_name'] ?? "");
  TextEditingController mobile = TextEditingController(
      text: getdata.read('logindata')['Result']['user_mobile'] ?? "");
  TextEditingController school = TextEditingController(
      text: getdata.read('logindata')['Result']['school_name'] ?? "");
  TextEditingController city = TextEditingController(
      text: getdata.read('logindata')['Result']['user_gam'] ?? "");
  TextEditingController district = TextEditingController(
      text: getdata.read('logindata')['Result']['user_taluko'] ?? "");
  TextEditingController taluka = TextEditingController(
      text: getdata.read('logindata')['Result']['user_jillo'] ?? "");
  TextEditingController Medium = TextEditingController(
      text: getdata.read('logindata')['Result']['user_medium'] ?? "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
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
                Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "popins Medium",
                      fontSize: 18),
                ),
                InkWell(
                  child: SizedBox(
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 9,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.1),
                          radius: 50,
                          backgroundImage: AssetImage(
                            'asstes/image/profile1.jpg',
                          ),
                        ),
                        const Positioned(
                            top: 68,
                            left: 68,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 17,
                            )),
                        const Positioned(
                            top: 70,
                            left: 70,
                            child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 15,
                                child: Center(
                                    child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.white,
                                )))),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        fontFamily: "popins",
                      ),
                      controller: fullname,
                      autofocus: false,
                      readOnly: true,
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
                      controller: Medium,
                      readOnly: true,
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
                      controller: mobile,
                      readOnly: true,
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
                      controller: school,
                      readOnly: true,
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
                      controller: city,
                      autofocus: false,
                      readOnly: true,
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
                      controller: district,
                      autofocus: false,
                      readOnly: true,
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
                      controller: taluka,
                      autofocus: false,
                      readOnly: true,
                      decoration: buildInputDecoration(
                          hintText: "Taluka",
                          lbltext: "Taluka",
                          prifix: Image.asset(
                            'asstes/image/Location.png',
                            scale: 2.5,
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: Get.height / 15,
                        width: Get.width / 2,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Update",
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
                  ],
                ),
              ),
            ))
          ],
        ),
      )),
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
          color: Colors.transparent,
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
