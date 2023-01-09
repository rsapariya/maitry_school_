import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schooolapp/dashboard/bottombar/bottombar.dart';
import 'package:schooolapp/dashboard/bottombar/home/pdf/selectchapter.dart';

import '../../../../../units/cusomewidget.dart';

class viewexam extends StatefulWidget {
  const viewexam({Key? key}) : super(key: key);

  @override
  State<viewexam> createState() => _viewexamState();
}

class _viewexamState extends State<viewexam> {
  @override
  bool langauge = true;
  String student = "11";
  var totel = 0;
  TextEditingController startdate = TextEditingController();
  TextEditingController endtdate = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: appButton(
          onTap: () {
            Get.to(() => selectchapter());
          },
          title: "Save and Continue"),
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
                    Text(
                      "Create Exam",
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
                Text(
                  "Select Standerd",
                  style: TextStyle(fontFamily: "popins Medium", fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          student = "11";
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
                                child: student == "11"
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
                              "11",
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
                          student = "22";
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
                                child: student == "22"
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
                              "12",
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
                          student = "both";
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
                                child: student == "both"
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
                              "Both",
                              style:
                                  TextStyle(fontFamily: "popins", fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                TextFormField(
                  style: TextStyle(
                    fontFamily: "popins",
                  ),
                  // controller: code,
                  autofocus: false,

                  decoration: buildInputDecoration(
                    hintText: "Enter Institute Name",
                    lbltext: "Enter Institute Name",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: startdate,
                  autofocus: false,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        startdate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: buildInputDecoration(
                      hintText: "Select Exam Start Date",
                      lbltext: "Select Exam Start Date",
                      surfix: Icon(
                        Icons.calendar_month_sharp,
                        color: Colors.blue,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: endtdate,
                  autofocus: false,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        endtdate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: buildInputDecoration(
                    hintText: "Select Exam End Date",
                    lbltext: "Select Exam End Date",
                    surfix: Icon(
                      Icons.calendar_month_sharp,
                      color: Colors.blue,
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
                    hintText: "Exam Totel Time (in minites)",
                    lbltext: "Exam Totel Time(in minites)",
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
                    hintText: "Select Marks of One Qestion",
                    lbltext: "Select Marks of One Qestion",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Negative Marks of One Qestion",
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
                        style: TextStyle(
                          fontFamily: "popins",
                        ),

                        // controller: code,
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
          borderRadius: BorderRadius.circular(20),
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
