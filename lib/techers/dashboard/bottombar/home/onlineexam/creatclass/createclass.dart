import 'package:flutter/material.dart';
import 'package:get/get.dart';

class createclass extends StatefulWidget {
  const createclass({Key? key}) : super(key: key);

  @override
  State<createclass> createState() => _createclassState();
}

class _createclassState extends State<createclass> {
  @override
  bool langauge = true;
  String student = "13";
  var totel = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: appButton(
      //     onTap: () {
      //       Get.to(() => selectchapter());
      //     },
      //     title: "Save and Continue"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
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
                        height: 40,
                        width: 40,
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
                      "Online Exam Result",
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
                  height: 25,
                ),
                const Text(
                  "Class Name",
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: "popins"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  // controller: code,
                  autofocus: false,
                  decoration: buildInputDecoration(
                    hintText: "Enter The Class Name",
                    lbltext: "Enter The Class Name",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Class Description",
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: "popins"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  // controller: code,
                  autofocus: false,
                  decoration: buildInputDecoration(
                    hintText: "Enter Description",
                    lbltext: "Enter Description",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: Get.height / 22,
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Create",
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
