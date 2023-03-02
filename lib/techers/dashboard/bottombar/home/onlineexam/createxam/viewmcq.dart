import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewmcq extends StatefulWidget {
  const viewmcq({Key? key}) : super(key: key);

  @override
  State<viewmcq> createState() => _viewmcqState();
}

class _viewmcqState extends State<viewmcq> {
  int selectedindex = 0;
  List chapter = [
    {
      "no": "0.1",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 4",
      "qest": "220 Qestions"
    },
    {
      "no": "0.2",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 1",
      "qest": "200 Qestions"
    },
    {
      "no": "0.3",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 3",
      "qest": "210 Qestions"
    },
    {
      "no": "0.4",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 2",
      "qest": "20 Qestions"
    },
    {
      "no": "0.5",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 1",
      "qest": "130 Qestions"
    },
    {
      "no": "0.6",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 2",
      "qest": "100 Qestions"
    },
    {
      "no": "0.7",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 3 ",
      "qest": "170 Qestions"
    },
    {
      "no": " 0.8",
      "name":
          "Loream ipsum is simply dummy text of the printing and industry ?",
      "mark": "Marks: 2",
      "qest": "190 Qestions"
    },
  ];
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
                        height:Get.height/20,
                        width:Get.width/9,
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
                          height:Get.height/20,
                          width:Get.width/9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {

                      });
                    },
                    child: Container(
                      height: Get.height / 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Manual",
                            style: TextStyle(
                                fontFamily: 'popins', color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.off(() => pdfgenrat());
                    },
                    child: Container(
                      height: Get.height / 25,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Auto",
                            style: TextStyle(
                                fontFamily: 'popins', color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    child: Container(
                      // height: Get.height / 13,
                      // width: Get.width / 3.7,
                      // color: Colors.grey.shade50,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(chapter[index]["no"],
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: Get.width / 1.3,
                                child: Text(chapter[index]["name"],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   ans = "B";
                              //
                              //   ans == "A" ? a = true : b = true;
                              // });
                            },
                            child: Container(
                              // height: Get.height / 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width / 1.3,
                                  child: Text("A. loraem ipsum",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   ans = "B";
                              //   ans == "B" ? b = true : b = false;
                              // });
                            },
                            child: Container(
                              // height: Get.height / 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width / 1.3,
                                  child: Text(
                                      "B. loream ipsum dummy text for editing ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   ans = "B";
                              //   ans == "C" ? c = true : b = true;
                              // });
                            },
                            child: Container(
                              // height: Get.height / 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width / 1.3,
                                  child: Text("C. The extrims of evil",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   ans = "B";
                              //   ans == "D" ? d = true : b = true;
                              // });
                            },
                            child: Container(
                              // height: Get.height / 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width / 1.3,
                                  child: Text("D. Latin profesor ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.off(() => pdfgenrat());
                                },
                                child: Container(
                                  height: Get.height / 25,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "Add +",
                                        style: TextStyle(
                                            fontFamily: 'popins',
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                chapter[index]["mark"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "popins",
                                    fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.blue,
                            thickness: 1,
                          )
                        ],
                      ),
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
