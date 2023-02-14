import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/prectice/prectice.dart';

class Testtopic extends StatefulWidget {
  const Testtopic({Key? key}) : super(key: key);

  @override
  State<Testtopic> createState() => _TesttopicState();
}

class _TesttopicState extends State<Testtopic> {
  int selectedindex = 0;
  List Topic = [
    {
      "no": "0.1",
      "name": "Topic 01",
      "topic": "7 topics",
      "qest": "220 Qestions",
      "Select": 'false'
    },
    {
      "no": "0.2",
      "name": "Topic 02",
      "topic": "19 topics",
      "qest": "200 Qestions",
      "Select": 'false'
    },
    {
      "no": "0.3",
      "name": "Topic 03",
      "topic": "8 topics",
      "qest": "210 Qestions",
      "Select": "false"
    },
    {
      "no": "0.4",
      "name": "Topic 04",
      "topic": "6 topics",
      "qest": "20 Qestions",
      "Select": "false"
    },
    {
      "no": "0.5",
      "name": "Topic 05",
      "topic": "7 topics",
      "qest": "130 Qestions",
      "Select": 'false'
    },
    {
      "no": "0.6",
      "name": "Topic 06",
      "topic": "10 topics",
      "qest": "100 Qestions",
      "Select": 'false'
    },
    {
      "no": "0.7",
      "name": "Topic 07",
      "topic": "2 topics",
      "qest": "170 Qestions",
      "Select": 'false'
    },
    {
      "no": " 0.8",
      "name": "Topic 08",
      "topic": "7 topics",
      "qest": "190 Qestions",
      "Select": 'false'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:InkWell(
        onTap:(){
          Get.to(()=>tacktest(),transition:Transition.leftToRight);
        },
        child:Container(
        height: Get.height / 17,
        width: Get.width / 4,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(60)),
        child: const Center(
          child: Text(
            "Next",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Gilroy Medium'),
          ),
        ),
      ),),
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
                    const Text(
                      "Select Topic",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "popins Medium",
                          fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child:const SizedBox(
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height / 40),
              SizedBox(
                height: Get.height / 1.3,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: Topic.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        Topic[index]['Select'] == 'true'
                            ? Topic[index]['Select'] = 'false'
                            : Topic[index]['Select'] = 'true';
                        print(Topic[index]['Select']);
                      });
                    },
                    child: Container(
                      // height: Get.height / 13,
                      // width: Get.width / 3.7,
                      // color: Colors.grey.shade50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      Topic[index]["no"],
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontFamily: 'Gilroy Medium'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Topic[index]["name"],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Gilroy Medium'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            Topic[index]["topic"],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: 'Gilroy Medium',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            Topic[index]["qest"],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: 'Gilroy Medium',
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: Get.height / 60,
                                      // ),
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      child: Topic[index]['Select'] == 'true'
                                          ? const Center(
                                              child: Icon(
                                                Icons.done,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                            )
                                          : const SizedBox(),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Topic[index]['Select'] ==
                                                      'true'
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          color:
                                          Topic[index]['Select'] == 'true'
                                                  ? Colors.blue
                                                  : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              indent: 60,
                              thickness: 1,
                            )
                          ],
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
    );
  }
}
