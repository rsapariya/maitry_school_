// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/techers/dashboard/bottombar/home/pdf/selecttopic.dart';
import '../../../../../student/home.dart';
import '../../../../units/api.dart';
import '../../../../units/storage.dart';

List<String> selectedChapterIds = [];

class selectchapter extends StatefulWidget {
  const selectchapter({Key? key}) : super(key: key);
  @override
  State<selectchapter> createState() => _selectchapterState();
}

class _selectchapterState extends State<selectchapter> {
  @override
  void initState() {
    Getchapter();

    selectedChapterIds.clear();

    super.initState();
  }

  int selectedindex = 0;
  List chapter = [];
  bool loading = true;
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
                      "Select Chapter",
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
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Get.to(()=>)
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
                            "Next",
                            style: TextStyle(
                                fontFamily: 'popins', color: Colors.white),
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
                      Get.off(() => const selecttopic(),
                          transition: Transition.leftToRight);
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
              const SizedBox(height: 10),
              loading == false
                  ? SizedBox(
                      height: Get.height / 1.3,
                      width: double.infinity,
                      child: chapter.isNotEmpty
                          ? ListView.builder(
                              itemCount: chapter.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    if (selectedChapterIds.contains(
                                        chapter[index]["chapter_id"]
                                            .toString())) {
                                      // If the chapter_id is already in the array, remove it
                                      selectedChapterIds.remove(chapter[index]
                                              ["chapter_id"]
                                          .toString());
                                    } else {
                                      // If the chapter_id is not in the array, add it
                                      selectedChapterIds.add(chapter[index]
                                              ["chapter_id"]
                                          .toString());
                                    }
                                  });
                                },
                                child: Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Get.width / 30,
                                          ),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width / 1.2,
                                                    child: Text(
                                                      chapter[index]
                                                          ["chapter_name"],
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'Gilroy Medium'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width / 1.2,
                                                    child: Text(
                                                      chapter[index]
                                                              ["chapter_id"]
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'Gilroy Medium'),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: selectedChapterIds
                                                                  .contains(
                                                                      chapter[index]["chapter_id"]
                                                                          .toString())
                                                              ? Colors.blue
                                                              : Colors.grey),
                                                      color: selectedChapterIds
                                                              .contains(chapter[index]
                                                                      [
                                                                      "chapter_id"]
                                                                  .toString())
                                                          ? Colors.blue
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(2)),
                                                  child: selectedChapterIds
                                                          .contains(chapter[
                                                                      index]
                                                                  ["chapter_id"]
                                                              .toString())
                                                      ? const Center(
                                                          child: Icon(
                                                            Icons.done,
                                                            size: 12,
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : const SizedBox(),
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
                            )
                          : const Center(
                              child: Text(
                                "No Data",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontFamily: 'popins'),
                              ),
                            ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: Get.height / 3),
                      child: const CircularProgressIndicator(strokeWidth: 3),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Getchapter() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Getchapter));
    request.fields.addAll({
      'group_id': '2',
      'medium': getdata.read('logindata')['Result']['user_medium'].toString(),
      'subject_name': 'Biology'
    });
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

    if (response.statusCode == 200) {
      if (val['success'] == true || val['Result'].toString().isNotEmpty) {
        chapter.clear();
        setState(() {

        });
        val['Result'].forEach((e) {
          chapter.add(e);
        });
        selectedChapterIds.add(chapter[0]["chapter_id"].toString());

        setState(() {
          loading = false;
        });
        print(chapter);
      } else {
        setState(() {
          chapter.clear();
          loading = false;
        });
      }
    } else {
      print(val);
      setState(() {
        loading = false;
      });
    }
  }
}
