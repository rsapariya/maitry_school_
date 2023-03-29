// ignore_for_file: non_constant_identifier_names, camel_case_types, sized_box_for_whitespace

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/prectice/testmcq.dart';
import 'package:schooolapp/techers/units/api.dart';
import 'package:schooolapp/techers/units/storage.dart';
List<Map> Mark = [
  {"ev_title": "1", "ev_id": "01"},
  {"ev_title": "4", "ev_id": "21"},
];
int Count = 1;
double Nega = 0;
String? _selected;
double nagetive = 0;
bool isnagative = false;

class tacktest extends StatefulWidget {
  const tacktest({Key? key}) : super(key: key);

  @override
  State<tacktest> createState() => _tacktestState();
}

class _tacktestState extends State<tacktest> {
  int Ma = 0;
  List<Map> Mark = [
    {"ev_title": "1", "ev_id": "01"},
    {"ev_title": "4", "ev_id": "21"},
  ];
  bool langauge = true;
  String student = "11";
  int totel = 0;
  TextEditingController startdate = TextEditingController();
  TextEditingController endtdate = TextEditingController();
  TextEditingController negative = TextEditingController();
  TextEditingController totelqu = TextEditingController();
  TextEditingController Testname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Form(
                key: formKey,
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
                          "Practice Test",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "popins Medium",
                              fontSize: 18),
                        ),
                        InkWell(
                          child: Container(
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 50,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        fontFamily: "popins",
                      ),
                      autofocus: false,
                      controller: Testname,
                      validator: (value) {
                        if (Testname.text.toString().isEmpty) {
                          return "Enter Test Name";
                        }
                        return null;
                      },
                      decoration: buildInputDecoration(
                        hintText: "Enter Test Name",
                        lbltext: "Enter Test Name",
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
                      child: drop(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Negative Marks of One Question",
                      style:
                          TextStyle(fontFamily: "popins Medium", fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isnagative = !isnagative;
                            });
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: isnagative ? Colors.blue : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: isnagative
                                        ? Colors.blue
                                        : Colors.grey)),
                            child: Center(
                                child: isnagative
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: Get.height / 14,
                          width: Get.width / 3,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              nagetive.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "popins",
                                  color:
                                      isnagative ? Colors.blue : Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
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
                            validator: (value) {
                              if (totelqu.text.toString().isEmpty) {
                                return "Enter Qes No";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontFamily: "popins",
                            ),
                            controller: totelqu,
                            autofocus: false,
                            decoration: buildInputDecoration(
                              hintText: "No of Question",
                              lbltext: "No of Question",
                            ),
                          ),
                        ),
                        Text(
                          "   =  $totel",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "popins",
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (_selected == null) {
                              ApiWrapper.fluttertosat(
                                  'Select Marks of Question');
                            } else {
                              setState(() {
                                Count = int.parse(totelqu.text);
                                save('testname', Testname.text);
                                save('Quesmark', Ma.toString());
                              });
                              Get.to(() => const TestMcqs(),
                                  transition: Transition.leftToRight);
                            }
                          }
                        },
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
                )),
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

  drop() {
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
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value as String;
            _selected == '01' ? nagetive = 0.25 : nagetive = 3;

            _selected == '01' ? Ma = 1 : Ma = 4;
            save('One', Ma);
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
