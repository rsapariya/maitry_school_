import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../techers/units/api.dart';
import '../../techers/units/storage.dart';
import 'mcqs.dart';

class selecttopics extends StatefulWidget {
  const selecttopics({Key? key}) : super(key: key);

  @override
  State<selecttopics> createState() => _selecttopicsState();
}

class _selecttopicsState extends State<selecttopics> {
  @override
  void initState() {
    Topics.clear();
    Topicapi();
    super.initState();
  }

  bool loding = true;
  int selectedindex = 0;
  List Topics = [];
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
                          const Text(
                            "Select Topic",
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
                   Expanded(child:  SizedBox(
                     width: double.infinity,
                     child: Topics.isNotEmpty
                         ? ListView.builder(
                       itemCount: Topics.length,
                       scrollDirection: Axis.vertical,
                       itemBuilder: (context, index) => InkWell(
                         splashColor: Colors.transparent,
                         onTap: () {
                           setState(() {
                             setState(() {
                               save(
                                   'topicID', Topics[index]["topic_id"]);
                             });
                             Get.to(() => const viewmcqs(),
                                 transition: Transition.leftToRight);
                             selectedindex = index;
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
                                       // Padding(
                                       //   padding: EdgeInsets.only(bottom: 12),
                                       //   child: Text(
                                       //     Topics[index]['topic_index']
                                       //             .toString() ??
                                       //         "",
                                       //     style: TextStyle(
                                       //         color: Colors.blue,
                                       //         fontSize: 20,
                                       //         fontFamily: 'Gilroy Medium'),
                                       //   ),
                                       // ),
                                       Column(
                                         crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         mainAxisAlignment:
                                         MainAxisAlignment.center,
                                         children: [
                                           SizedBox(
                                             width: Get.width / 1.3,
                                             child: Text(
                                               Topics[index]
                                               ['topic_name'] ??
                                                   "",
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 18,
                                                   fontFamily:
                                                   'Gilroy Medium'),
                                             ),
                                           ),
                                           SizedBox(
                                             height: 5,
                                           ),
                                           // Row(
                                           //   children: [
                                           //     Text(
                                           //       chapter[index]["qest"]??"",
                                           //       style: TextStyle(
                                           //         color: Colors.grey,
                                           //         fontSize: 12,
                                           //         fontFamily: 'Gilroy Medium',
                                           //       ),
                                           //     ),
                                           //   ],
                                           // ),
                                           // SizedBox(
                                           //   height: Get.height / 60,
                                           // ),
                                         ],
                                       ),
                                       const Spacer(),
                                       const Icon(
                                         Icons.navigate_next,
                                         color: Colors.grey,
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
                             fontSize: 18,
                             color: Colors.blue,
                             fontFamily: 'popins'),
                       ),
                     ),
                   )),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.blue,
                ),
              ),
      ),
    );
  }

  Topicapi() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Tpoic));
    request.fields.addAll({
      "chapterids": '[${getdata.read('chepterid').toString()}]',
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);

    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          Topics.clear();
        });
        val['Result'].forEach((e) {
          Topics.add(e);
        });

        print("---------->>>>>");
        print("---------->>>>>$Topics");
        setState(() {
          loding = false;
        });
      } else {
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
