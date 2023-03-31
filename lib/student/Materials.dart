import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:schooolapp/student/home.dart';
import 'package:schooolapp/techers/units/api.dart';
import 'package:http/http.dart' as http;

import '../techers/login/mainscreen.dart';
import '../techers/units/storage.dart';

class Materials extends StatefulWidget {
  const Materials({Key? key}) : super(key: key);
  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  bool langauge = true;
  bool loding = true;

  @override
  void initState() {
    GetMaterials();
    super.initState();
  }

  @override
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          "asstes/image/backwrrow.png",
                          scale: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Short Material",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins Medium",
                        fontSize: 18),
                  ),
                  const InkWell(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: loding == false
                    ? RefreshIndicator(
                        onRefresh: Regresg,
                        child: InkWell(
                          child: Materialss.isNotEmpty
                              ? ListView.builder(
                                  itemCount: Materialss.length,
                                  itemBuilder: (_, index) {
                                    return InkWell(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width / 40),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          Get.height / 120),
                                                  child: Container(
                                                    width: Get.width / 10,
                                                    height: Get.height / 20,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.blue
                                                            .withOpacity(0.1)),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "asstes/image/PDF.png",
                                                        scale: 5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: Get.width / 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Materialss[index][
                                                              "materials_name"] ??
                                                          "",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "popins Medium",
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      Materialss[index][
                                                              "chapter_name"] ??
                                                          "",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "popins Medium",
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Materialss[index]
                                                            ["ref_group_id"] ==
                                                        true
                                                    ? const CircularProgressIndicator(
                                                        strokeWidth: 3)
                                                    : const SizedBox()
                                              ],
                                            ),
                                            const Divider()
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          Materialss[index]["ref_group_id"] =
                                              true;
                                        });
                                        downloadAndOpenFile(index)
                                            .then((value) {})
                                            .catchError((error) {});
                                      },
                                    );
                                  },
                                )
                              : const SizedBox(
                                  child: Center(
                                    child: Text(
                                      "No Data",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontFamily: "popins"),
                                    ),
                                  ),
                                ),
                        ))
                    : const Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(strokeWidth: 3),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> downloadAndOpenFile(int index) async {
    Dio dio = Dio();
    var directory = await getTemporaryDirectory();
    var filePath =
        '${directory.path}/${Materialss[index]["materials_filename"]}';
    try {
      await dio.download(Materialss[index]["materials_filename"], filePath);
      OpenFilex.open(filePath);
      setState(() {
        Materialss[index]["ref_group_id"] = false;
      });
    } catch (e) {
      ApiWrapper.fluttertosat('Something Went Wrong');
      setState(() {
        Materialss[index]["ref_group_id"] = false;
      });
    }
  }

  Future<void> Regresg() async {
    GetMaterials();
  }

  // ignore: non_constant_identifier_names
  GetMaterials() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Materials));
    request.fields.addAll({
      'group_id': groupid.toString(),
      'medium': getdata.read('logindata')['Result']['user_medium'].toString(),
      'subject_name': selectedItem2.toString()
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
    jsonString = jsonEncode(val);
    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          Materialss.clear();
        });
        val['Result'].forEach((e) {
          Materialss.add(e);
        });
        setState(() {});
        loding = false;
        print(val);
      } else {
        Materialss.clear();
        loding = false;
        setState(() {});
      }
    } else {
      setState(() {});
      loding = false;
    }
  }
}
