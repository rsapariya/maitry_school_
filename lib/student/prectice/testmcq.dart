import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/prectice/result.dart';
import '../../techers/units/storage.dart';

List chapters = [
  {
    "question":
        " 1. Loream ipsum is simply dummy text of the printing and industry ?",
    "a": "A. dummy text of the printing",
    "b": "B. Loream ipsum is ",
    "c": "C. simply dummy text",
    "d": "D. simply dummy text of",
  },
  {
    "question":
        " 2. Loream ipsum is simply dummy text of the printing and industry ?",
    "a": "A. dummy text of the printing",
    "b": "B. Loream ipsum is ",
    "c": "C. simply dummy text",
    "d": "D. simply dummy text of",
  },
  {
    "question":
        " 3. Loream ipsum is simply dummy text of the printing and industry ?",
    "a": "A. dummy text of the printing",
    "b": "B. Loream ipsum is ",
    "c": "C. simply dummy text",
    "d": "D. simply dummy text of",
  },
  {
    "question":
        " 4. Loream ipsum is simply dummy text of the printing and industry ?",
    "a": "A. dummy text of the printing",
    "b": "B. Loream ipsum is ",
    "c": "C. simply dummy text",
    "d": "D. simply dummy text of",
  },
  {
    "question":
        " 5. Loream ipsum is simply dummy text of the printing and industry ?",
    "a": "A. dummy text of the printing",
    "b": "B. Loream ipsum is ",
    "c": "C. simply dummy text",
    "d": "D. simply dummy text of",
  },
];
int select = 0;

class TestMcqs extends StatefulWidget {
  const TestMcqs({Key? key}) : super(key: key);

  @override
  State<TestMcqs> createState() => _TestMcqsState();
}

class _TestMcqsState extends State<TestMcqs> {
  @override
  void initState() {
    select = 0;
    save('Mcqs', chapters[select]);
    super.initState();
  }

  int next = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            select != 0
                ? InkWell(
                    onTap: () {
                      setState(() {
                        select--;
                        next--;
                        save('Mcqs', chapters[select]);
                        print(select);
                      });
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: Get.height / 20,
                    width: Get.width / 6,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
            select + 2 <= chapters.length
                ? InkWell(
                    onTap: () {
                      setState(() {
                        select++;
                        next++;
                        save('Mcqs', chapters[select]);
                        print(select);
                      });
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Get.off(() => PrecticeResult(),
                          transition: Transition.topLevel);
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
            select + 2 <= chapters.length
                ? InkWell(
                    onTap: () {
                      setState(() {});
                      select++;
                      next++;
                      print(select);
                      save('Mcqs', chapters[select]);
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: Get.height / 20,
                    width: Get.width / 6,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Get.height / 80, horizontal: Get.width / 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Get.height / 20,
                        width: Get.width / 9,
                      ),
                      Text(
                        "Question: ${next}/${chapters.length}",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins Medium",
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: Get.height / 20,
                        width: Get.width / 9,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 1.1,
                        child: Text(getdata.read('Mcqs')['question'],
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
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width / 1.3,
                          child: Text(getdata.read('Mcqs')['a'],
                              style: TextStyle(
                                color: Colors.black,
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
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width / 1.3,
                          child: Text(getdata.read('Mcqs')['b'],
                              style: TextStyle(
                                color: Colors.black,
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
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width / 1.3,
                          child: Text(getdata.read('Mcqs')['c'],
                              style: TextStyle(
                                color: Colors.black,
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
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width / 1.3,
                          child: Text(getdata.read('Mcqs')['d'],
                              style: TextStyle(
                                color: Colors.black,
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
            )),
      ),
    );
  }
}
