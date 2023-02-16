import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/student/persnoldata.dart';

import '../../../../student/Requestacher.dart';
import '../../../login/register.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  String selectedItem = '11th';
  String selectedItem2 = 'Biology';
  bool status = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Get.height / 20,
                    width: Get.width / 9,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontFamily: 'popins Medium',
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: Get.height / 20,
                    width: Get.width / 9,
                  ),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('asstes/image/profile1.jpg'),
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Ravi Sapariya",
                        style: TextStyle(
                            fontFamily: 'popins',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Text(
                        "Teacher",
                        style: TextStyle(
                            fontFamily: 'popins Medium',
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(() => Editpro(),
                          transition: Transition.leftToRight);
                    },
                    child: Container(
                      height: Get.height / 25,
                      width: Get.width / 4.5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Edit",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        // offset: Offset(9,7),
                        spreadRadius: 4,
                        blurRadius: 5,
                        color: Colors.grey.withOpacity(0.1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ), //982226024468

                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: const [
                          Text(
                            "Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "popins Medium"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Personal Data",
                          image: "asstes/image/Placeholder.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      student == true
                          ? roww(
                              onTap: () {
                                Get.to(() => const Jointeacher(),
                                    transition: Transition.leftToRight);
                              },
                              titel: "Join with Teacher",
                              image: "asstes/image/Placeholder.png")
                          : const SizedBox(),
                      student == true
                          ? const SizedBox(
                              height: 15,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        // offset: Offset(0,7),
                        spreadRadius: 4,
                        blurRadius: 5,
                        color: Colors.grey.withOpacity(0.1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Notification",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "popins Medium"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Pop-up Notification",
                          image: "asstes/image/profile/Icon-Notif.png",
                          darkmode: SizedBox(
                            height: Get.height / 50,
                            child: Transform.scale(
                              scale: 0.8,
                              child: CupertinoSwitch(
                                value: status,
                                activeColor: Colors.blue,
                                onChanged: (value) async {
                                  setState(() {
                                    status = value;
                                  });
                                },
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        // offset: Offset(9,7),
                        spreadRadius: 4,
                        blurRadius: 5,
                        color: Colors.grey.withOpacity(0.1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Other",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "popins Medium"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Contact Us",
                          image: "asstes/image/profile/Icon-Message.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Privacy Policy",
                          image: "asstes/image/profile/Icon-Privacy.png"),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  roww(
      {image,
      required String titel,
      void Function()? onTap,
      Widget? darkmode}) {
    return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              child: Row(
                children: [
                  Image.asset(
                    image,
                    scale: 2.5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    titel,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 14, fontFamily: "popins"),
                  ),
                ],
              ),
            ),
            const Spacer(),
            darkmode ??
                Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.grey,
                )
          ],
        ));
  }
}