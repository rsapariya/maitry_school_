import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
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
                children: const [
                  SizedBox(
                    height: 40,
                    width: 40,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontFamily: 'popins Medium',
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
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
                  Container(
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
                      ),
                      const Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "popins Medium"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Persnol Deta",
                          image: "asstes/image/Placeholder.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Achivement",
                          image: "asstes/image/profile/Achievement.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Activity History",
                          image: "asstes/image/profile/Icon-Activity.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      roww(
                          titel: "Timer",
                          image: "asstes/image/profile/Time Circle.png"),
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
                      roww(
                          titel: "Setting",
                          image: "asstes/image/profile/Icon-Setting.png"),
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
    return Row(
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
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.navigate_next_outlined,
                color: Colors.grey,
              ),
            ),
      ],
    );
  }
}
