import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/onlineexam/mcqs.dart';
import 'package:schooolapp/techers/units/storage.dart';

import '../bottoms.dart';

class OneMcqs extends StatefulWidget {
  const OneMcqs({Key? key}) : super(key: key);

  @override
  State<OneMcqs> createState() => _OneMcqsState();
}

class _OneMcqsState extends State<OneMcqs> {
  String? one;

  bool hide = false;
  bool result = true;
  bool fees = false;
  var answer;
  var selectedanswer;
  int next = MCqlist.length + 1;
  @override
  void initState() {
    print(select);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height / 80, horizontal: Get.width / 30),
          child:SingleChildScrollView(child: Column(
            children: [
              Container(
                child:SingleChildScrollView(child:Column(
                  children: [ Row(
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
                              "asstes/image/more.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "MCQs",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins Medium",
                            fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            fees = false;
                          });
                          _dialogBuilder(context);
                        },
                        child: Container(
                          height: Get.height / 20,
                          width: Get.width / 9,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    SizedBox(
                      height: Get.height / 1.25,
                      width: double.infinity,
                      child: Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 1.1,
                                  child:
                                  Text(getdata.read('MCQ')["mcq_question"] ?? "",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: getdata.read('MCQ')['mcqs_answer'] == "A"
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: getdata.read('MCQ')['mcqs_answer'] == "A"
                                          ? Colors.green
                                          : Colors.transparent,
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                        "A." + getdata.read('MCQ')['mcqs_option1'] ??
                                            "",
                                        style: TextStyle(
                                          color: getdata.read('MCQ')['mcqs_answer'] ==
                                              "A"
                                              ? Colors.green
                                              : Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: getdata.read('MCQ')['mcqs_answer'] == "B"
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: getdata.read('MCQ')['mcqs_answer'] == "B"
                                          ? Colors.green
                                          : Colors.transparent,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                        "B." + getdata.read('MCQ')['mcqs_option2'] ??
                                            "",
                                        style: TextStyle(
                                          color: getdata.read('MCQ')['mcqs_answer'] ==
                                              "B"
                                              ? Colors.green
                                              : Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: Container(
                                // height: Get.height / 20,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: getdata.read('MCQ')['mcqs_answer'] == "C"
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: getdata.read('MCQ')['mcqs_answer'] == "C"
                                          ? Colors.green
                                          : Colors.transparent,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                        "C." + getdata.read('MCQ')['mcqs_option3'] ??
                                            "",
                                        style: TextStyle(
                                          color: getdata.read('MCQ')['mcqs_answer'] ==
                                              "C"
                                              ? Colors.green
                                              : Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: getdata.read('MCQ')['mcqs_answer'] == "D"
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: getdata.read('MCQ')['mcqs_answer'] == "D"
                                          ? Colors.green
                                          : Colors.transparent,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: Get.width / 1.3,
                                    child: Text(
                                        "D." + getdata.read('MCQ')['mcqs_option4'] ??
                                            "",
                                        style: TextStyle(
                                          color: getdata.read('MCQ')['mcqs_answer'] ==
                                              "D"
                                              ? Colors.green
                                              : Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )],),)
                ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  select != 0
                      ? InkWell(
                    onTap: () {
                      setState(() {
                        select--;
                        save('MCQ', MCqlist[select]);
                        print(select);
                      });
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 9,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                      : Container(
                    height: Get.height / 20,
                    width: Get.width / 9,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  select + 2 <= MCqlist.length
                      ? InkWell(
                    onTap: () {
                      setState(() {});
                      select++;
                      print(select);
                      save('MCQ', MCqlist[select]);
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 9,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                      : Container(
                    height: Get.height / 20,
                    width: Get.width / 9,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),)
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.blue.withOpacity(0.2),
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 4),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    Container(
                      height: Get.height / 12,
                      width: Get.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Image.asset(
                          'asstes/image/Edit.png',
                          scale: 3.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    const Text(
                      "Are you sure you want to exit?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins Medium",
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const bottoms());
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
                              "Exit",
                              style: TextStyle(
                                  fontFamily: 'popins', color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 40,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Get.back();
                        });
                      },
                      child: Container(
                        height: Get.height / 25,
                        width: Get.width / 3,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontFamily: 'popins', color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
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
      filled: false,
    );
  }
}
