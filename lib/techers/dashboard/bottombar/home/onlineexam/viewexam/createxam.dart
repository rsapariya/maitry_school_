import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/onlineexam/viewexam/qestionpaper.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/techers/units/storage.dart';
import '../../../../../login/mainscreen.dart';
import '../../../../../units/api.dart';

List allExam = [];

class examlist extends StatefulWidget {
  const examlist({Key? key}) : super(key: key);
  @override
  State<examlist> createState() => _examlistState();
}

class _examlistState extends State<examlist> {
  int selectedindex = 0;
  bool loding = true;
  @override
  void initState() {
    super.initState();
  }

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
                    const Text(
                      "Exam List",
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
              const SizedBox(height: 10),
              allExam.isNotEmpty
                  ? SizedBox(
                      height: Get.height / 1.3,
                      width: double.infinity,
                      child: RefreshIndicator(
                        onRefresh: regresher,
                        child: ListView.builder(
                          itemCount: allExam.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                save("Examid",
                                    allExam[index]['exam_id'].toString());
                              });
                              Get.to(() => const qestionpaper(),
                                  transition: Transition.leftToRight);
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width / 30),
                                    child: Row(
                                      children: [
                                        Text(
                                          allExam[index]["no"] ?? "",
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontFamily: 'Gilroy Medium'),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              allExam[index]["exam_name"] ?? "",
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
                                                  allExam[index]["exam_date"] ??
                                                      "",
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontFamily: 'Gilroy Medium',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  allExam[index]["time"] ?? "",
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontFamily: 'Gilroy Medium',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              'asstes/image/profile/delet.png',
                                              scale: 3.5,
                                            )),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: Get.height / 2.5),
                      child: Text(
                        'No Exam Found!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'popins Medium'),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> regresher() async {
    Getallexam();
  }

  Getallexam() async {
    print('------------------- GET ALL EXAM ----------------');
    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.allexamtech));
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(parse(respStr).documentElement?.text ?? '');
    String jsonString = jsonEncode(val);
    jsonString = jsonString
        .replaceAll('</p>', "")
        .replaceAll('</span>', "")
        .replaceAll('</td>', "")
        .replaceAll('</tr>', "")
        .replaceAll('</o:p>', "")
        .replaceAll('</table>', "")
        .replaceAll('</tbody>', "");

    val = jsonDecode(jsonString);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          allExam.clear();
          val['Result'].forEach((e) {
            allExam.add(e);
          });
          print('-- GET ALL EXAM->>$val');
        });
        setState(() {});
      } else {
        print('-- GET ALL EXAM->>$val');
      }
    } else {
      print('-- GET ALL EXAM->>$val');
    }
  }
}
