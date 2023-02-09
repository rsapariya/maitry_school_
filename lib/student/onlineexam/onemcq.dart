import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/onlineexam/mcqs.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/pdf/selecttopic.dart';
import 'package:schooolapp/techers/units/storage.dart';

import 'onlineexam.dart';

class OneMcqs extends StatefulWidget {
  const OneMcqs({Key? key}) : super(key: key);

  @override
  State<OneMcqs> createState() => _OneMcqsState();
}

class _OneMcqsState extends State<OneMcqs> {
  bool hide = false;
  bool result = true;
  var answer;
  var selectedanswer;
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
          child: Column(
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
                    "MCQs",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins Medium",
                        fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      _dialogBuilder(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
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
              const SizedBox(height: 10),
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
                          Text(getdata.read('MCQ')["no"],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: Get.width / 1.25,
                            child: Text(getdata.read('MCQ')["name"],
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
                        onTap: () {
                          setState(() {
                            selectedanswer = "A";
                            answer = "B";
                          });
                        },
                        child: Container(
                          // height: Get.height / 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text("A. loraem ipsum",
                                  style: TextStyle(
                                    color: selectedanswer == "A"
                                        ? selectedanswer == answer
                                            ? Colors.green
                                            : Colors.red
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
                        onTap: () {
                          setState(() {});

                          selectedanswer = "B";
                          answer = "B";
                        },
                        child: Container(
                          // height: Get.height / 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text(
                                  "B. loream ipsum dummy text for editing ",
                                  style: TextStyle(
                                    color: selectedanswer == "B"
                                        ? selectedanswer == answer
                                            ? Colors.green
                                            : Colors.red
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
                        onTap: () {
                          setState(() {});
                          answer = "B";
                          selectedanswer = "C";
                        },
                        child: Container(
                          // height: Get.height / 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text("C. The extrims of evil",
                                  style: TextStyle(
                                    color: selectedanswer == "C"
                                        ? selectedanswer == answer
                                            ? Colors.green
                                            : Colors.red
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
                        onTap: () {
                          setState(() {});
                          answer = "B";
                          selectedanswer = "D";
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width / 1.3,
                              child: Text("D. Latin profesor ",
                                  style: TextStyle(
                                    color: selectedanswer == "D"
                                        ? selectedanswer == answer
                                            ? Colors.green
                                            : Colors.red
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          select != 0
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      select--;
                                      save('MCQ', chapter[select]);
                                      print(select);
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
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
                                  height: 40,
                                  width: 40,
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
                          select <= int.parse(getdata.read('MCQ')["no"][1])
                              ? InkWell(
                                  onTap: () {
                                    setState(() {});
                                    select++;
                                    save('MCQ', chapter[select]);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
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
                                  height: 40,
                                  width: 40,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                hide = true;
                              });
                            },
                            child: Container(
                              height: Get.height / 25,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Hint Answer",
                                    style: TextStyle(
                                        fontFamily: 'popins',
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                daiool();
                              });
                            },
                            child: Container(
                              height: Get.height / 25,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Send Feedback",
                                    style: TextStyle(
                                        fontFamily: 'popins',
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      hide == true
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blue)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width / 30,
                                    vertical: Get.height / 100),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Hint : ",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "popins"),
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.35,
                                      child: const Text(
                                        "loream ipsum doller hint ipsum doller hint answer",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "popins"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                      width: Get.width / 2.2,
                      child: const Text(
                        "You have attempted 2 out  of 15 question",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "popins",
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const selectchapters());
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

  Future<void> daiool() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              insetAnimationCurve: Curves.linear, //this right here
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Cool',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Awesome',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Got It!',
                          style:
                              TextStyle(color: Colors.purple, fontSize: 18.0),
                        ))
                  ],
                ),
              ),
            ));
  }
}
