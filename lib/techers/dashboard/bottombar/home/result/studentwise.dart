import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

List<Map> myJson = [
  {"ev_title": "Saumil", "ev_id": "01"},
  {"ev_title": "vekariya", "ev_id": "21"},
  {"ev_title": "hemadri", "ev_id": "20"},
  {"ev_title": "rahil", "ev_id": "19"},
  {"ev_title": "rahul", "ev_id": "13"},
];


List<Map> Classes = [
];

class Studentwise extends StatefulWidget {
  const Studentwise({Key? key}) : super(key: key);

  @override
  State<Studentwise> createState() => _StudentwiseState();
}

class _StudentwiseState extends State<Studentwise> {
  String? _selected;
  List Student = [
    {"a": "Exam 1", "b": "05 August"},
    {"a": "Exam 2", "b": "16 August"},
    {"a": "Exam 3", "b": "19 August"},
    {"a": "Exam 4", "b": "26 August"},
    {"a": "Exam 5", "b": "27 August"},
    {"a": "Exam 6", "b": "28 August"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
            child: Container(
              width: double.infinity,
              height: Get.height / 15,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: drop(),
            ),
          ),
          SizedBox(
            height: Get.height / 60,
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
                      )),
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
                      )),
                  SizedBox(
                      width: Get.width / 8,
                      child: const Center(
                        child: Text(
                          'Get',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popins",
                              fontSize: 14),
                        ),
                      )),
                  SizedBox(
                      width: Get.width / 7.8,
                      child: const Center(
                        child: Text(
                          'Total',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popins",
                              fontSize: 14),
                        ),
                      )),
                  SizedBox(
                    width: Get.width / 8,
                    child: const Center(
                      child: Text(
                        'Per',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "popins",
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Student.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                ),
                              )),
                          SizedBox(
                              width: Get.width / 8,
                              child: const Center(
                                child: Text(
                                  '29',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "popins Medium",
                                      fontSize: 14),
                                ),
                              )),
                          SizedBox(
                              width: Get.width / 7.8,
                              child: const Center(
                                child: Text(
                                  '50',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "popins Medium",
                                      fontSize: 14),
                                ),
                              )),
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
                              )),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
                'Select student',
                style: TextStyle(
                    fontSize: 14, color: Colors.blue, fontFamily: 'popins'),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: myJson
            .map((Map map) => DropdownMenuItem<String>(
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
                ))
            .toList(),
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value as String;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26, width: 1.5),
            color: Colors.white.withOpacity(0.2),
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
