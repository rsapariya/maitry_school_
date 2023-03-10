// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/pdf/selectchapter.dart';

import '../../../../units/cusomewidget.dart';

class pdfgenrat extends StatefulWidget {
  const pdfgenrat({Key? key}) : super(key: key);

  @override
  State<pdfgenrat> createState() => _pdfgenratState();
}

class _pdfgenratState extends State<pdfgenrat> {
  bool langauge = true;
  bool Anskey = false;
  bool Solution = false;
  String student = "11";
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: appButton(
          onTap: () {
            Get.to(() => const selectchapter(),
                transition: Transition.leftToRight);
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
                      "Create PDF",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins Medium",
                          fontSize: 18),
                    ),
                    InkWell(
                      child: SizedBox(
                        child: SizedBox(
                          height: Get.height / 20,
                          width: Get.width / 9,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height / 50,
                ),
                const Text(
                  "Select Standerd",
                  style: TextStyle(fontFamily: "popins Medium", fontSize: 16),
                ),
                const SizedBox(
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
                      child: Row(
                        children: [
                          Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.blue)),
                              child: student == "11"
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
                            "11",
                            style:
                                TextStyle(fontFamily: "popins", fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          student = "22";
                        });
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
                              child: student == "22"
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
                            "12",
                            style:
                                TextStyle(fontFamily: "popins", fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          student = "both";
                        });
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
                              child: student == "both"
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
                            "Both",
                            style:
                                TextStyle(fontFamily: "popins", fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    hintText: "School Name",
                    lbltext: "School Name",
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
                    hintText: "Subject",
                    lbltext: "Subject",
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
                    hintText: "Test name",
                    lbltext: "Test name",
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
                    hintText: "Total Marks",
                    lbltext: "Total Marks",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: const TextStyle(
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
                      //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        date.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                  decoration: buildInputDecoration(
                      hintText: "Date",
                      lbltext: "Date",
                      surfix: const Icon(
                        Icons.calendar_month_sharp,
                        color: Colors.blue,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Water Marks",
                  style: TextStyle(fontFamily: "popins Medium", fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  readOnly: true,
                  // controller: code,
                  autofocus: false,
                  decoration: buildInputDecoration(
                      hintText: "Answer Key",
                      lbltext: "Answer Key",
                      surfix: InkWell(
                        onTap: () {
                          setState(() {
                            Anskey = !Anskey;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            width: 10,
                            decoration: BoxDecoration(
                                color: Anskey == false
                                    ? Colors.white
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Anskey == false
                                        ? Colors.grey
                                        : Colors.blue)),
                            child: Center(
                              child: Anskey == false
                                  ? const SizedBox()
                                  : const Icon(
                                      Icons.done,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  readOnly: true,
                  // controller: code,
                  autofocus: false,
                  decoration: buildInputDecoration(
                    hintText: "Solution",
                    lbltext: "Solution",
                    surfix: InkWell(
                      onTap: () {
                        setState(() {
                          Solution = !Solution;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: 10,
                          decoration: BoxDecoration(
                              color: Solution == false
                                  ? Colors.white
                                  : Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Solution == false
                                      ? Colors.grey
                                      : Colors.blue)),
                          child: Center(
                            child: Solution == false
                                ? const SizedBox()
                                : const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                          ),
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
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: Colors.white, width: 0.5, strokeAlign: StrokeAlign.center),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 2.0,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
