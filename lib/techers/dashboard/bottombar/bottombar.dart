// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:schooolapp/student/bottoms.dart';
import 'package:schooolapp/techers/dashboard/bottombar/profile/profile.dart';
import 'package:schooolapp/techers/dashboard/bottombar/wallet/wallet.dart';

import '../../units/storage.dart';
import 'about/about.dart';
import 'home/home.dart';

int selectedIndex = 0;

class bottomt extends StatefulWidget {
  const bottomt({Key? key}) : super(key: key);

  @override
  State<bottomt> createState() => _bottomtState();
}

class _bottomtState extends State<bottomt> {
  final List screens = [
    const home(),
    const about(),
    const wallet(),
    const profile(),
  ];
  // late ColorNotifire notifire;
  @override
  void initState() {
    Xapi = getdata.read('logindata')['Result']['user_api'].toString();
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 8.7,
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(fontFamily: 'Gilroy Medium'),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Gilroy Medium'),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Divider(
                    thickness: 2,
                    color:
                        selectedIndex == 0 ? Colors.blue : Colors.transparent,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Image.asset(
                    selectedIndex == 0
                        ? 'asstes/image/homee.png'
                        : 'asstes/image/nnn1.png',
                    color: selectedIndex == 0 ? Colors.blue : Colors.black,
                    scale: 2,
                  ),
                ],
              ),
              label: "home".tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Divider(
                    thickness: 2,
                    color:
                        selectedIndex == 1 ? Colors.blue : Colors.transparent,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Image.asset(
                    selectedIndex == 1
                        ? "asstes/image/nnn2.png"
                        : 'asstes/image/Info Square.png',
                    color: selectedIndex == 1 ? Colors.blue : Colors.black,
                    scale: 2,
                  ),
                ],
              ),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Divider(
                    thickness: 2,
                    color:
                        selectedIndex == 2 ? Colors.blue : Colors.transparent,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Image.asset(
                    selectedIndex == 2
                        ? "asstes/image/nnn3.png"
                        : 'asstes/image/Wallet.png',
                    color: selectedIndex == 2 ? Colors.blue : Colors.black,
                    scale: 2,
                  ),
                ],
              ),
              label: "order".tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Divider(
                    thickness: 2,
                    color:
                        selectedIndex == 3 ? Colors.blue : Colors.transparent,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Image.asset(
                    selectedIndex == 3
                        ? "asstes/image/nnn4.png"
                        : 'asstes/image/Profile.png',
                    color: selectedIndex == 3 ? Colors.blue : Colors.black,
                    scale: 2,
                  ),
                ],
              ),
              label: "profile".tr,
            ),
          ],
          onTap: (index) {
            // setState(() {});
            // if (getdata.read('logindata') != null) {
            //   selectedIndex = index;
            // } else {
            //   index != 0 ? Get.to(home()) : SizedBox();
            // }
            setState(() {});
            selectedIndex = index;
          },
        ),
      ),
    );
  }

  void getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.version;
    setState(() {});

    if (packageName != getdata.read('varsion')) {
      _showMyDialogg();
    }
  }

  Future<void> _showMyDialogg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Maitry App New version 0.0.${getdata.read('varsion')} is available',
            style: TextStyle(fontFamily: "popins"),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {});
                  Get.back();
                },
                child: const Text(
                  'Later',
                  style: TextStyle(fontFamily: "popins", color: Colors.black),
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    LaunchReview.launch(androidAppId: "com.jciindiazone8.app");
                    Get.back();
                  });
                },
                child: const Text(
                  'Update Now',
                  style: TextStyle(color: Colors.blue, fontFamily: "popins"),
                )),
          ],
        );
      },
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
