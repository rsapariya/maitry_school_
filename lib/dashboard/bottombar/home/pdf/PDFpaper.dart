import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schooolapp/dashboard/bottombar/bottombar.dart';
import 'package:schooolapp/dashboard/bottombar/home/pdf/selectchapter.dart';

import '../../../../units/cusomewidget.dart';

class pdfgenrat extends StatefulWidget {
  const pdfgenrat({Key? key}) : super(key: key);

  @override
  State<pdfgenrat> createState() => _pdfgenratState();
}

class _pdfgenratState extends State<pdfgenrat> {
  @override
  bool langauge = true;
  String student = "11";
  TextEditingController date = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: appButton(
          onTap: () {
            Get.to(() => selectchapter());
          },
          title: "Submit"),
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
                      "Create PDF",
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
                    hintText: "School Name",
                    lbltext: "School Name",
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
                    hintText: "Subject",
                    lbltext: "Subject",
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
                    hintText: "Test name",
                    lbltext: "Test name",
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
                    hintText: "Total Marks",
                    lbltext: "Total Marks",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: date,
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
                        date.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: buildInputDecoration(
                      hintText: "Date",
                      lbltext: "Date",
                      surfix: Icon(
                        Icons.calendar_month_sharp,
                        color: Colors.blue,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Water Marks",
                  style: TextStyle(fontFamily: "popins Medium", fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  style: TextStyle(
                    fontFamily: "popins",
                  ),
                  readOnly: true,
                  // controller: code,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "Answer Key",
                      lbltext: "Answer Key",
                      surfix: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: TextStyle(
                    fontFamily: "popins",
                  ),
                  readOnly: true,
                  // controller: code,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "Solution",
                      lbltext: "Solution",
                      surfix: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                        ),
                      )),
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
          width: 2.0,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
