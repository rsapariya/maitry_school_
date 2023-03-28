import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:schooolapp/student/home.dart';
import 'package:schooolapp/techers/units/api.dart';

class Materials extends StatefulWidget {
  const Materials({Key? key}) : super(key: key);
  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  @override
  bool langauge = true;
  bool loding = false;
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
                  Text(
                    "Short Material",
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
                child: InkWell(
                  child: ListView.builder(
                    itemCount: Materialss.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height / 120),
                                    child: Container(
                                        width: Get.width / 10,
                                        height: Get.height / 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.blue.withOpacity(0.1)),
                                        child: Center(
                                            child: Image.asset(
                                          "asstes/image/PDF.png",
                                          scale: 5,
                                        ))),
                                  ),
                                  SizedBox(width: Get.width / 20),
                                  Text(
                                    Materialss[index]["materials_name"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "popins Medium",
                                        fontSize: 14),
                                  ),
                                  Spacer(),
                                  Materialss[index]["ref_group_id"] == true
                                      ? CircularProgressIndicator(
                                          strokeWidth: 3,
                                        )
                                      : SizedBox()
                                ],
                              ),
                              Divider()
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            Materialss[index]["ref_group_id"] = true;
                          });
                          downloadAndOpenFile(index)
                              .then((value) {})
                              .catchError((error) {});
                        },
                      );
                    },
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
}
