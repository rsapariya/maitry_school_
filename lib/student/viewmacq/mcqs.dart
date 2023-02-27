import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/units/storage.dart';
import 'package:http/http.dart' as http;

import '../../techers/units/api.dart';
import 'onemcq.dart';

int select = 0;
List MCqlist = [];

class viewmcqs extends StatefulWidget {
  const viewmcqs({Key? key}) : super(key: key);

  @override
  State<viewmcqs> createState() => _viewmcqsState();
}

class _viewmcqsState extends State<viewmcqs> {
  bool loding = true;
  @override
  void initState() {
    McqAPI();
    super.initState();
  }

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: loding == false
            ? Padding(
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
                                height: Get.height / 20,
                                width: Get.width / 9,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: Get.height / 1.15,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: MCqlist.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: InkWell(
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.4,
                                        child: Text(
                                            MCqlist[index]["mcq_question"] ??
                                                "",
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
                                save('MCQ', MCqlist[select]);
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
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
      ),
    );
  }

  McqAPI() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.MCqs));
    request.fields
        .addAll({"topicids": '[${getdata.read('topicID').toString()}]'});
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    // RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    var val = jsonDecode(respStr);

    // String parsedstring1 = html.replaceAll(exp, '');

    if (response.statusCode == 200) {
      print("----");
      print(val);
      if (val['success'] == true) {
        setState(() {
          MCqlist.clear();
        });
        val['Result'].forEach((e) {
          MCqlist.add(e);
        });
        setState(() {
          loding = false;
        });
        print("------>>> ${MCqlist}");
      } else {
        print("--else--->>> ${MCqlist}");
        setState(() {
          loding = false;
        });
      }
    } else {
      print("---else-->>> ${val}");
      setState(() {
        loding = false;
      });
    }
  }
}
