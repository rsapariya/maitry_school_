import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/onlineexam/onemcq.dart';
import 'package:schooolapp/techers/units/storage.dart';

int select = 0;
List chapter = [
  {
    "no": "01.",
    "name": "Loream ipsum is simply dummy text of the printing and industry ?",
    "mark": "Marks: 4",
    "qest": "220 Qestions"
  },
  {
    "no": "02.",
    "name": "Loream ipsum is  printing and industry ?",
    "mark": "Marks: 1",
    "qest": "200 Qestions"
  },
  {
    "no": "03.",
    "name": "Loream ipsum is simply dummy text of  and industry ?",
    "mark": "Marks: 3",
    "qest": "210 Qestions"
  },
  {
    "no": "04.",
    "name": "Loream  dummy text of the printing and industry ?",
    "mark": "Marks: 2",
    "qest": "20 Qestions"
  },
  {
    "no": "05.",
    "name": "simply dummy text of the printing and industry ?",
    "mark": "Marks: 1",
    "qest": "130 Qestions"
  },
  {
    "no": "06.",
    "name": "Loream ipsum is simply dummy text of the printing and industry ?",
    "mark": "Marks: 2",
    "qest": "100 Qestions"
  },
  {
    "no": "07.",
    "name": "Loream ipsum is simply  the printing and industry ?",
    "mark": "Marks: 3 ",
    "qest": "170 Qestions"
  },
  {
    "no": " 08.",
    "name": "Loream ipsum is simply dummy text of the  ?",
    "mark": "Marks: 2",
    "qest": "190 Qestions"
  },
];

class viewmcqs extends StatefulWidget {
  const viewmcqs({Key? key}) : super(key: key);

  @override
  State<viewmcqs> createState() => _viewmcqsState();
}

class _viewmcqsState extends State<viewmcqs> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 80),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30,
                ),
                child: Row(
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
                      "MCQs",
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
              ),
              SizedBox(height: 10),
              SizedBox(
                height: Get.height / 1.25,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: chapter.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: InkWell(
                      child: Container(
                        // height: Get.height / 13,
                        // width: Get.width / 3.7,
                        // color: Colors.grey.shade50,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chapter[index]["no"],
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: "popins",
                                      fontSize: 16,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: Get.width / 1.4,
                                  child: Text(chapter[index]["name"],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "popins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                                Spacer(),
                                Icon(Icons.navigate_next)
                              ],
                            ),
                            Divider(
                              color: Colors.blue,
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          print(index);
                          select = index;
                          save('MCQ', chapter[select]);
                        });
                        Get.to(() => const OneMcqs(),
                            transition: Transition.leftToRight);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
