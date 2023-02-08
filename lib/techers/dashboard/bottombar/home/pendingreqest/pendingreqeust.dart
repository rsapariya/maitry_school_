import 'package:flutter/material.dart';
import 'package:get/get.dart';

class pendingreqest extends StatefulWidget {
  const pendingreqest({Key? key}) : super(key: key);

  @override
  State<pendingreqest> createState() => _pendingreqestState();
}

class _pendingreqestState extends State<pendingreqest> {
  @override
  bool langauge = true;
  List notifi = ['11', '22'];
  int sselectedindex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
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
                  Text(
                    "Student Request",
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
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  // controller: controller,
                  itemCount: notifi.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: Get.height / 100),
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                          _showMyDialog();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 40,
                                vertical: Get.height / 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " John Deo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "popins"),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            Icons.done,
                                            size: 15,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Accept Request ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "popins"),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(40)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Class'),
          content: SingleChildScrollView(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        print('----');
                        setState(() {});
                        Navigator.of(context).pop();
                        sselectedindex == index;
                        print(sselectedindex.toString());
                      },
                      child: Row(
                        children: [
                          Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.blue)),
                              child: sselectedindex == index
                                  ? Center(
                                      child: Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Colors.blue,
                                      ),
                                    )
                                  : SizedBox()),
                          SizedBox(
                            width: 10,
                          ),
                          Text(notifi[index]),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.white,
                  );
                },
                itemCount: notifi.length),
          ),
        );
      },
    );
  }
}
