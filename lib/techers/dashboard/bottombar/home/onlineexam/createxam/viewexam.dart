// ignore_for_file: camel_case_types, avoid_unnecessary_containers, avoid_print, equal_keys_in_map

import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../../student/prectice/prectice.dart';
import '../../../../../login/mainscreen.dart';
import '../../../../../units/api.dart';
import '../../../../../units/cusomewidget.dart';
import '../../../../../units/storage.dart';
import '../../pdf/selectchapter.dart';
import '../../result/studentwise.dart';
import 'getx.dart';

int Markof = 0;
bool lodinexam = false;
RxInt count = 0.obs;
TextEditingController quesNo = TextEditingController();

class viewexam extends StatefulWidget {
  const viewexam({Key? key}) : super(key: key);
  @override
  State<viewexam> createState() => _viewexamState();
}

class _viewexamState extends State<viewexam> {
  final HomePageController controller = Get.put(HomePageController());
  bool langauge = true;

  String student = "1";
  String? _selected;
  String? _selected2;

  TimeOfDay? selectedTime;
  bool Nagative = false;

  TextEditingController Examdate = TextEditingController();
  TextEditingController Examtime = TextEditingController();
  TextEditingController examname = TextEditingController();
  TextEditingController inname = TextEditingController();
  TextEditingController toteltime = TextEditingController();
  TextEditingController markofqes = TextEditingController();
  TextEditingController Nagetive = TextEditingController();
  TextEditingController Exammark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: lodinexam == false
          ? appButton(
              onTap: () {
                print(_selected2.toString());
                print(_selected.toString());
                print(Markof.toString());
                if (_formkey.currentState!.validate()) {
                  if (_selected != null) {
                    if (_selected2 != null) {
                      setState(() {
                        lodinexam = true;
                      });
                      CreateExam();
                    } else {
                      ApiWrapper.fluttertosat("Please Select Mark of Question");
                    }
                  } else {
                    ApiWrapper.fluttertosat("Please Select Class");
                  }
                }
              },
              title: "Save and Continue")
          : loding(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: Form(
            key: _formkey,
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
                      "Create Exam",
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
                  height: Get.height / 80,
                ),
                Expanded(
                    child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Select Standerd",
                          style: TextStyle(
                              fontFamily: "popins Medium", fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  student = "1";
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1, color: Colors.blue)),
                                      child: student == "1"
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
                                    style: TextStyle(
                                        fontFamily: "popins", fontSize: 14),
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
                                  student = "2";
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
                                        child: student == "2"
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
                                      style: TextStyle(
                                          fontFamily: "popins", fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: Get.height / 15,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: drop(),
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
                          controller: examname,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Exam Name";
                            }
                          }),
                          decoration: buildInputDecoration(
                            hintText: "Enter Exam Name",
                            lbltext: "Enter Exam Name",
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
                          controller: inname,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Institute Name";
                            }
                          }),
                          decoration: buildInputDecoration(
                            hintText: "Enter Institute Name",
                            lbltext: "Enter Institute Name",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontFamily: "popins",
                          ),
                          controller: Examdate,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Select Exam Start Date";
                            }
                          }),
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

                              setState(() {
                                Examdate.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                          decoration: buildInputDecoration(
                              hintText: "Select Exam Start Date",
                              lbltext: "Select Exam Start Date",
                              surfix: const Icon(
                                Icons.calendar_month_sharp,
                                color: Colors.blue,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontFamily: "popins",
                          ),
                          controller: Examtime,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Select Exam End Date";
                            }
                          }),
                          autofocus: false,
                          readOnly: true,
                          onTap: () {
                            _selectTime(context);
                          },
                          decoration: buildInputDecoration(
                            hintText: "Exam Time",
                            lbltext: "Exam Time",
                            surfix: const Icon(
                              Icons.timer_outlined,
                              color: Colors.blue,
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
                          controller: toteltime,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Select Exam End Date";
                            } else if (value.isAlphabetOnly) {
                              return "Enter Only Number";
                            }
                          }),
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          decoration: buildInputDecoration(
                            hintText: "Exam Total Time (in minutes)",
                            lbltext: "Exam Total Time(in minutes)",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: Get.height / 15,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: drop2(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const Text(
                        //   "Negative Marks of One Question",
                        //   style: TextStyle(fontFamily: "popins Medium", fontSize: 16),
                        // ),
                        // Row(
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         setState(() {
                        //           isnagative = !isnagative;
                        //         });
                        //       },
                        //       child: Container(
                        //         width: 25,
                        //         height: 25,
                        //         decoration: BoxDecoration(
                        //             color: isnagative ? Colors.blue : Colors.white,
                        //             borderRadius: BorderRadius.circular(5),
                        //             border: Border.all(
                        //                 color: isnagative ? Colors.blue : Colors.grey)),
                        //         child: Center(
                        //             child: isnagative
                        //                 ? const Icon(
                        //                     Icons.done,
                        //                     color: Colors.white,
                        //                   )
                        //                 : const SizedBox()),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Container(
                        //       height: Get.height / 14,
                        //       width: Get.width / 3,
                        //       decoration: BoxDecoration(
                        //           color: Colors.grey.withOpacity(0.1),
                        //           borderRadius: BorderRadius.circular(10)),
                        //       child: Center(
                        //         child: Text(
                        //           nagetive.toString(),
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               fontFamily: "popins",
                        //               color: isnagative ? Colors.blue : Colors.grey),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "MCQ   X  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "popins",
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: Get.width / 2.5,
                              child: TextFormField(
                                controller: quesNo,
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "Select No of Question";
                                  } else if (value.isAlphabetOnly) {
                                    return "Enter Only Number";
                                  }
                                }),
                                onChanged: (value) {
                                  int number = int.tryParse(value) ?? 0;
                                  count.value = number * Markof;
                                },
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontFamily: "popins",
                                ),
                                autofocus: false,
                                decoration: buildInputDecoration(
                                  hintText: "No of Question",
                                  lbltext: "No of Question",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 4,
                              child: Obx(
                                () => Text(
                                  "   =  ${count.value}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "popins",
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
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

  CreateExam() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.CreEAXM));
    request.fields.addAll({
      'exam_mark': count.value.toString(),
      'exam_group_id': student.toString(),
      'class_id': _selected.toString(),
      'exam_name': examname.text,
      'exam_institute_name': inname.text,
      'exam_date': Examdate.text,
      'exam_time': Examtime.text,
      'exam_totaltimetime': toteltime.text,
      'exam_markofques': Markof.toString(),
      'exam_mcqs_1': '0',
      'exam_ques_1': '0',
      'exam_ques_2': '0',
      'exam_ques_3': '0',
      'exam_ques_4': '0',
      'exam_ques_5': '0'
    });
    print(request.fields);
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        save('Examid', val);
        setState(() {
          lodinexam = false;
        });

        ApiWrapper.fluttertosat(val['message'].toString());
        Get.off(() => const selectchapter(),
            transition: Transition.leftToRight);
        print("-------- -->>> $val");
      } else {
        ApiWrapper.fluttertosat(val['message'].toString());
        setState(() {
          lodinexam = false;
        });
        print("---else 2 -->>> $val");
      }
    } else {
      ApiWrapper.fluttertosat(val['message'].toString());
      print("---else-->>> $val");
      setState(() {
        lodinexam = false;
      });
    }
  }

  drop() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'Select Class',
                style: TextStyle(
                    fontSize: 14, color: Colors.black, fontFamily: 'popins'),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: Classes.map((Map map) => DropdownMenuItem<String>(
              value: map["student_class_id"].toString(),
              child: Text(
                map['student_class_name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'popins',
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )).toList(),
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value as String;
            print(_selected);
          });
        },
        buttonStyleData: const ButtonStyleData(
          height: 50,
          width: 160,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.blue,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: null,
          maxHeight: 200,
          elevation: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
        Examtime.text = selectedTime.toString();
      });
    }
  }

  drop2() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'Select Marks of One Question',
                style: TextStyle(
                    fontSize: 14, color: Colors.blue, fontFamily: 'popins'),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: Mark.map((Map map) => DropdownMenuItem<String>(
              value: map["ev_id"].toString(),
              child: Text(
                map['ev_title'],
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'popins',
                  color: Colors.blue,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )).toList(),
        value: _selected2,
        onChanged: (value) {
          setState(() {
            _selected2 = value as String;
            _selected2 == '01' ? nagetive = 0.25 : nagetive = 3;

            _selected2 == '01' ? Markof = 1 : Markof = 4;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.blue,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: null,
          maxHeight: 200,
          elevation: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
