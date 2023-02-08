import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooolapp/techers/dashboard/bottombar/profile/profile.dart';
import 'package:schooolapp/techers/dashboard/bottombar/wallet/wallet.dart';

import '../techers/dashboard/bottombar/about/about.dart';
import 'home.dart';

int selectedIndex = 0;

class bottoms extends StatefulWidget {
  const bottoms({Key? key}) : super(key: key);

  @override
  State<bottoms> createState() => _bottomstState();
}

class _bottomstState extends State<bottoms> {
  final List screens = [
    const homes(),
    const about(),
    const wallet(),
    const profile(),
  ];
  @override
  void initState() {
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

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
//
// getdarkmodepreviousstate() async {
//   final prefs = await SharedPreferences.getInstance();
//   bool? previusstate = prefs.getBool("setIsDark");
//   if (previusstate == null) {
//     notifire.setIsDark = false;
//   } else {
//     notifire.setIsDark = previusstate;
//   }
// }
}
