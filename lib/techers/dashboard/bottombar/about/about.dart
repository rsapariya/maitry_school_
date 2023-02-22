import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../units/string.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: SizedBox(
                        child: Container(
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    const Text(
                      "About Us",
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
                const Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                const Text(
                  "Author",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "popins Medium",
                      fontSize: 18),
                ),
                const Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                const Text(
                  "Mitul. R Kapadiya\nAsst. Teacher\nAdarsh Nivasi Shala (Kanya,S.T) Navsari",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "popins", fontSize: 16),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const Text(
                  "Joshi RajivKumar C. (MSc. BEd.)\nExp.: 20 Years\nSarv Vidhyalay High School, Kadi,\nTa,:Kadi, Dist.: Maheshana",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "popins", fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    _contactus();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      Text(
                        " 94275 44735",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins",
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const Text(
                  "Rutu Rajivkumar Joshi\nMSc.PHD.(Pursuing)",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "popins", fontSize: 16),
                ),
                const Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                const Text(
                  "Owner",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "popins Medium",
                      fontSize: 18),
                ),
                const Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                const Text(
                  "Bharti. N. Kamaliya",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "popins", fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    contactus();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      Text(
                        " 97271 51721",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins",
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    emaiollaunch();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      Text(
                        " maitribiologyapp@gmail.com",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "popins",
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  contactus() async {
    var url = Uri.parse("tel:+9197271 51721");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _contactus() async {
    var url = Uri.parse("tel:+919427544735");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // _wahtt() async {
  //   String number = '972715721';
  //
  //   final Uri uri = Uri.parse("whatsapp://send?phone=" + "91" + number);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw "ERROR ";
  //   }
  // }
  emaiollaunch() async {
    String email = 'maitribiologyapp@gmail.com';
    launch('mailto:$email');
  }
}
