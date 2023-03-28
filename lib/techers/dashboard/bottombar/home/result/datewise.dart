import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../../units/api.dart';

class Datewise extends StatefulWidget {
  const Datewise({Key? key}) : super(key: key);

  @override
  State<Datewise> createState() => _DatewiseState();
}

class _DatewiseState extends State<Datewise> {
  bool loding = false;
  List Student = [];

  @override
  void initState() {
    super.initState();
  }

  TextEditingController startdate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: TextFormField(
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
                firstDate: DateTime(2000),
                lastDate: DateTime(2101));
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                startdate.text = formattedDate;
                loding = true;
              });
              GetExam();
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
            ),
          ),
        ),
      ),
      SizedBox(
        height: Get.height / 70,
      ),
      Container(
          color: Colors.blue,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: Get.height / 80),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 10,
                      child: const Center(
                        child: Text(
                          'Sr',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popins",
                              fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2.2,
                      child: const Center(
                        child: Text(
                          'Name',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popins",
                              fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: Get.width / 8,
                        child: const Center(
                            child: Text('Get',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "popins",
                                    fontSize: 14)))),
                    SizedBox(
                        width: Get.width / 7.8,
                        child: const Center(
                            child: Text('Total',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "popins",
                                    fontSize: 14)))),
                    SizedBox(
                        width: Get.width / 8,
                        child: const Center(
                            child: Text('Per',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "popins",
                                    fontSize: 14))))
                  ]))),
      SizedBox(
        height: 10,
      ),
      loding == false
          ? Student.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      itemCount: Student.length,
                      itemBuilder: (_, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 40),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: Get.width / 10,
                                          child: const Center(
                                            child: Text(
                                              '123',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "popins Medium",
                                                  fontSize: 14),
                                            ),
                                          )),
                                      SizedBox(
                                          width: Get.width / 2.2,
                                          child: const Center(
                                              child: Text(
                                            'Saumil vekariya',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "popins Medium",
                                                fontSize: 14),
                                          ))),
                                      SizedBox(
                                          width: Get.width / 8,
                                          child: const Center(
                                              child: Text(
                                            '29',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "popins Medium",
                                                fontSize: 14),
                                          ))),
                                      SizedBox(
                                          width: Get.width / 7.8,
                                          child: const Center(
                                              child: Text(
                                            '50',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "popins Medium",
                                                fontSize: 14),
                                          ))),
                                      SizedBox(
                                        width: Get.width / 8,
                                        child: const Center(
                                          child: Text(
                                            '17.21%',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "popins Medium",
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider()
                                ]));
                      }))
              : Padding(
                  padding: EdgeInsets.only(top: Get.height / 3.5),
                  child: Text(
                    'No Record Found!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'popins Medium'),
                  ),
                )
          : Padding(
              padding: EdgeInsets.only(top: Get.height / 3),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 3,
                ),
              ),
            )
    ]));
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
            color: Colors.white, width: 0.5, strokeAlign: StrokeAlign.center),
      ),
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

  GetExam() async {
    print('------------ Get Exam -----------');
    print(startdate.text);
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.dateresult));
    request.fields.addAll({"date": startdate.text.toString()});
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
      print("----");
      print(val);
      if (val['success'] == true) {
        val['Result'].forEach((e) {
          Student.addAll(e);
        });

        setState(() {
          loding = false;
        });
      } else {
        setState(() {
          loding = false;
        });
      }
    } else {
      ApiWrapper.fluttertosat(val['message'].toString());
      print("---else-->>> ${val}");
      setState(() {
        loding = false;
      });
    }
  }
}
