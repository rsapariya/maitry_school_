import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/result/datewise.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/result/studentwise.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height / 80),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
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
                    "Result",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins Medium",
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height / 80, horizontal: Get.width / 30),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TabBar(
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.blue,
                    controller: _tabController,
                    indicatorPadding: const EdgeInsets.all(4),
                    indicator: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40)),
                    tabs: const [
                      Text(
                        'Date wise',
                        style: TextStyle(fontFamily: 'popins', fontSize: 16),
                      ),
                      Text(
                        'Student wise',
                        style: TextStyle(fontFamily: 'popins', fontSize: 16),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [Datewise(), Studentwise()],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
