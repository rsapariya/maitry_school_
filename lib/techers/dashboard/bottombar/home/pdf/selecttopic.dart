import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:schooolapp/student/prectice/prectice.dart';
import 'package:schooolapp/student/prectice/selectch.dart';
import '../../../../units/api.dart';

List<String> selectedToicIds = [];

class selecttopic extends StatefulWidget {
  const selecttopic({Key? key}) : super(key: key);

  @override
  State<selecttopic> createState() => _selecttopicState();
}

class _selecttopicState extends State<selecttopic> {
  int selectedindex = 0;
  List Topic = [];
  bool loding = true;

  @override
  void initState() {
    Topicapi();
    selectedToicIds.clear();
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
                      child: const SizedBox(
                        height: 40,
                        width: 40,
                      ),
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
                    onTap: () {},
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
              Expanded(
                  child: SizedBox(
                width: double.infinity,
                child: loding == false
                    ? Topic.isNotEmpty
                        ? ListView.builder(
                            itemCount: Topic.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  if (selectedToicIds.contains(
                                      Topic[index]["topic_id"].toString())) {
                                    // If the chapter_id is already in the array, remove it
                                    selectedToicIds.remove(
                                        Topic[index]["topic_id"].toString());
                                  } else {
                                    // If the chapter_id is not in the array, add it
                                    selectedToicIds.add(
                                        Topic[index]["topic_id"].toString());
                                  }
                                });
                              },
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                    Topic[index]
                                                            ["topic_name"] ??
                                                        "",
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
                                                        color: selectedToicIds
                                                                .contains(Topic[index]
                                                                        [
                                                                        "topic_id"]
                                                                    .toString())
                                                            ? Colors.blue
                                                            : Colors.grey),
                                                    color: selectedToicIds
                                                            .contains(Topic[index]
                                                                    ["topic_id"]
                                                                .toString())
                                                        ? Colors.blue
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(2)),
                                                child: selectedToicIds.contains(
                                                        Topic[index]["topic_id"]
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
                                        thickness: 1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              "No Data",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontFamily: 'popins'),
                            ),
                          )
                    : Center(
                        child: const CircularProgressIndicator(strokeWidth: 3),
                      ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Topicapi() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Tpoic));
    request.fields.addAll({"chapterids": '$selectedChapterIds'});
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
      print("----");
      print(val);
      if (val['success'] == true) {
        val['Result'].forEach((e) {
          Topic.add(e);
        });
        selectedToicIds.add(Topic[0]["topic_id"].toString());
        setState(() {
          loding = false;
        });
      } else {
        setState(() {
          loding = false;
        });
      }
    } else {
      setState(() {
        loding = false;
      });
    }
  }
}
