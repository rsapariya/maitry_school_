import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:schooolapp/login/mainscreen.dart';
import 'package:schooolapp/units/media.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);
  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  // late ColorNotifire notifire;
  // getdarkmodepreviousstate() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   bool? previusstate = prefs.getBool("setIsDark");
  //   if (previusstate == null) {
  //     notifire.setIsDark = false;
  //   } else {
  //     notifire.setIsDark = previusstate;
  //   }
  // }

  void initState() {
    super.initState();
    _currentPage = 0;

    _slides = [
      Slide("asstes/image/bussness.png", "Lorean ipsum doller Sit amet",
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
      Slide("asstes/image/bussness.png", "Lorean ipsum doller Sit amet",
          " will be distracted by the readable content of a page when looking at its layout It is a long established fact that a reader."),
      Slide("asstes/image/bussness.png", "Lorean ipsum doller Sit amet",
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();
  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  Widget _buildSlide(Slide slide) {
    // notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Image.asset(
                    "asstes/image/back.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    "asstes/image/shadow.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Padding(
                padding:
                    EdgeInsets.only(top: Get.height / 8, left: 20, right: 20),
                child: Container(
                  child: Image.asset(
                    slide.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height / 2.3,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width / 1.3,
                        child: Text(
                          slide.heading,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontFamily: "popins",
                              fontSize: 26),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width / 1.3,
                        child: Text(
                          slide.subtitel,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontFamily: "popins",
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            )

            //
          ],
        ),
      ),
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(SizedBox(
          width: 10,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 20 : 10,
      height: index == _currentPage ? 10 : 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index == _currentPage
              ? Colors.blue
              : Colors.blue.withOpacity(0.2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Get.height / 1.7,
            // bottom: 0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: Get.height / 3.5, //indicator set screen
                ),
                _buildPageIndicator(),
                SizedBox(height: Get.height / 35 //indicator set screen
                    ),
                _currentPage == 2
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Get.off(() => mainscreen());
                              });
                            },
                            child: Container(
                              height: 50,
                              width: Get.width / 1.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "continue",
                                    style: TextStyle(
                                        fontFamily: "popins",
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ))
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          child: GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                  duration: const Duration(microseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              height: 50,
                              width: Get.width / 1.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Get Started",
                                    style: TextStyle(
                                        fontFamily: "popins",
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        )),
                SizedBox(
                  height: Get.height / 20, //indicator set screen
                ),
                const SizedBox(height: 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Slide {
  String image;
  String heading;
  String subtitel;

  Slide(this.image, this.heading, this.subtitel);
}