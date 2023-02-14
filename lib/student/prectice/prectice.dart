import 'package:flutter/material.dart';
import 'package:get/get.dart';


class tacktest extends StatefulWidget {
  const tacktest({Key? key}) : super(key: key);

  @override
  State<tacktest> createState() => _tacktestState();
}

class _tacktestState extends State<tacktest> {
  @override
  bool langauge = true;
  String student = "11";
  var totel = 0;
  TextEditingController startdate = TextEditingController();
  TextEditingController endtdate = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        height:Get.height/20,
                        width:Get.width/9,
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
                      "Practice Test",
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
                SizedBox(
                  height: Get.height / 50,
                ),
                TextFormField(
                  style: TextStyle(
                    fontFamily: "popins",
                  ),
                  // controller: code,
                  autofocus: false,

                  decoration: buildInputDecoration(
                    hintText: "Select class",
                    lbltext: "Select class",
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
                    hintText: "Enter Exam Name",
                    lbltext: "Enter Exam Name",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Negative Marks of One Question",
                  style: TextStyle(fontFamily: "popins Medium", fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: Get.width / 2,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: "popins",
                        ),

                        // controller: code,
                        autofocus: false,
                        decoration: buildInputDecoration(
                          hintText: "marks",
                          lbltext: "0.25",
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "MCQ   X  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins",
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: Get.width / 2.5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontFamily: "popins",
                        ),
                        autofocus: false,
                        decoration: buildInputDecoration(
                          hintText: "No of Qestion",
                          lbltext: "No of Qestion",
                        ),
                      ),
                    ),
                    Text(
                      "   =  ${totel}",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins",
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    child: Container(
                      height: Get.height / 25,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Take Test",
                            style: TextStyle(
                                fontFamily: 'popins', color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
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
      hintStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: TextStyle(fontFamily: "popins", fontSize: 14),
      labelText: lbltext,
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
