// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:schooolapp/student/onlineexam/mcqs.dart';
// import 'package:schooolapp/techers/units/storage.dart';
//
// import 'onlineexam.dart';
//
// class OneMcqs extends StatefulWidget {
//   const OneMcqs({Key? key}) : super(key: key);
//
//   @override
//   State<OneMcqs> createState() => _OneMcqsState();
// }
//
// class _OneMcqsState extends State<OneMcqs> {
//   String? one;
//
//   bool hide = false;
//   bool result = true;
//   bool fees = false;
//   var answer;
//   var selectedanswer;
//   @override
//   void initState() {
//     print(select);
//     super.initState();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Stack(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     vertical: Get.height / 80, horizontal: Get.width / 30),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Container(
//                             height: Get.height / 20,
//                             width: Get.width / 9,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Center(
//                               child: Image.asset(
//                                 "asstes/image/backwrrow.png",
//                                 scale: 1.5,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Text(
//                           "MCQs",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "popins Medium",
//                               fontSize: 18),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               fees = false;
//                             });
//                             _dialogBuilder(context);
//                           },
//                           child: Container(
//                             height: Get.height / 20,
//                             width: Get.width / 9,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Center(
//                               child: Icon(
//                                 Icons.close,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     SizedBox(
//                       height: Get.height / 1.25,
//                       width: double.infinity,
//                       child: Container(
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // SizedBox(width:Get.width/1.3,child: Text(
//                                 //     getdata.read('MCQ')["mcq_question"] ?? "",
//                                 //     style: const TextStyle(
//                                 //       color: Colors.blue,
//                                 //       fontSize: 20,
//                                 //     )),),
//                                 // const SizedBox(
//                                 //   width: 5,
//                                 // ),
//                                 SizedBox(
//                                   width: Get.width / 1.1,
//                                   child: Text(
//                                       getdata.read('MCQ')["mcq_question"] ?? "",
//                                       style: const TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.normal,
//                                       )),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   // selectedanswer = "A";
//                                   // answer = "B";
//                                 });
//                               },
//                               child: Container(
//                                 // height: Get.height / 20,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(color: Colors.transparent)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: SizedBox(
//                                     width: Get.width / 1.3,
//                                     child: Text(
//                                         "A." +
//                                             getdata
//                                                 .read('MCQ')['mcqs_option1'] ??
//                                             "",
//                                         style: TextStyle(
//                                           color: selectedanswer == "A"
//                                               ? selectedanswer == answer
//                                               ? Colors.green
//                                               : Colors.red
//                                               : Colors.black,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.normal,
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {});
//                                 // selectedanswer = "B";
//                                 // answer = "B";
//                               },
//                               child: Container(
//                                 // height: Get.height / 20,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(color: Colors.transparent)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: SizedBox(
//                                     width: Get.width / 1.3,
//                                     child: Text(
//                                         "B." +
//                                             getdata
//                                                 .read('MCQ')['mcqs_option2'] ??
//                                             "",
//                                         style: TextStyle(
//                                           color: selectedanswer == "B"
//                                               ? selectedanswer == answer
//                                               ? Colors.green
//                                               : Colors.red
//                                               : Colors.black,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.normal,
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {});
//                                 // answer = "B";
//                                 // selectedanswer = "C";
//                               },
//                               child: Container(
//                                 // height: Get.height / 20,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(color: Colors.transparent)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: SizedBox(
//                                     width: Get.width / 1.3,
//                                     child: Text(
//                                         "C." +
//                                             getdata
//                                                 .read('MCQ')['mcqs_option3'] ??
//                                             "",
//                                         style: TextStyle(
//                                           color: selectedanswer == "C"
//                                               ? selectedanswer == answer
//                                               ? Colors.green
//                                               : Colors.red
//                                               : Colors.black,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.normal,
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {});
//                                 // answer = "B";
//                                 // selectedanswer = "D";
//                               },
//                               child: Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(color: Colors.transparent)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: SizedBox(
//                                     width: Get.width / 1.3,
//                                     child: Text(
//                                         "D." +
//                                             getdata
//                                                 .read('MCQ')['mcqs_option4'] ??
//                                             "",
//                                         style: TextStyle(
//                                           color: selectedanswer == "D"
//                                               ? selectedanswer == answer
//                                               ? Colors.green
//                                               : Colors.red
//                                               : Colors.black,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.normal,
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             // Row(
//                             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             //   children: [
//                             //     select != 0
//                             //         ? InkWell(
//                             //             onTap: () {
//                             //               setState(() {
//                             //                 select--;
//                             //                 save('MCQ', MCqlist[select]);
//                             //                 print(select);
//                             //               });
//                             //             },
//                             //             child: Container(
//                             //               height: Get.height / 20,
//                             //               width: Get.width / 9,
//                             //               decoration: BoxDecoration(
//                             //                   color: Colors.blue,
//                             //                   borderRadius:
//                             //                       BorderRadius.circular(10)),
//                             //               child: const Center(
//                             //                 child: Icon(
//                             //                   Icons.arrow_back,
//                             //                   color: Colors.white,
//                             //                 ),
//                             //               ),
//                             //             ),
//                             //           )
//                             //         : Container(
//                             //             height: Get.height / 20,
//                             //             width: Get.width / 9,
//                             //             decoration: BoxDecoration(
//                             //                 color: Colors.blue.withOpacity(0.2),
//                             //                 borderRadius:
//                             //                     BorderRadius.circular(10)),
//                             //             child: const Center(
//                             //               child: Icon(
//                             //                 Icons.arrow_back,
//                             //                 color: Colors.blue,
//                             //               ),
//                             //             ),
//                             //           ),
//                             //     select <= int.parse(getdata.read('MCQ')["no"][1])
//                             //         ? InkWell(
//                             //             onTap: () {
//                             //               setState(() {});
//                             //               select++;
//                             //               save('MCQ', MCqlist[select]);
//                             //             },
//                             //             child: Container(
//                             //               height: Get.height / 20,
//                             //               width: Get.width / 9,
//                             //               decoration: BoxDecoration(
//                             //                   color: Colors.blue,
//                             //                   borderRadius:
//                             //                       BorderRadius.circular(10)),
//                             //               child: const Center(
//                             //                 child: Icon(
//                             //                   Icons.arrow_forward,
//                             //                   color: Colors.white,
//                             //                 ),
//                             //               ),
//                             //             ),
//                             //           )
//                             //         : Container(
//                             //             height: Get.height / 20,
//                             //             width: Get.width / 9,
//                             //             decoration: BoxDecoration(
//                             //                 color: Colors.blue.withOpacity(0.2),
//                             //                 borderRadius:
//                             //                     BorderRadius.circular(10)),
//                             //             child: const Center(
//                             //               child: Icon(
//                             //                 Icons.arrow_forward,
//                             //                 color: Colors.blue,
//                             //               ),
//                             //             ),
//                             //           ),
//                             //   ],
//                             // ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Stack(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           hide = true;
//                                         });
//                                       },
//                                       child: Container(
//                                         height: Get.height / 25,
//                                         decoration: BoxDecoration(
//                                             color: Colors.blue,
//                                             borderRadius:
//                                             BorderRadius.circular(30)),
//                                         child: const Center(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 20),
//                                             child: Text(
//                                               "Hint Answer",
//                                               style: TextStyle(
//                                                   fontFamily: 'popins',
//                                                   color: Colors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           fees = true;
//                                         });
//                                       },
//                                       child: Container(
//                                         height: Get.height / 25,
//                                         decoration: BoxDecoration(
//                                             color: Colors.blue,
//                                             borderRadius:
//                                             BorderRadius.circular(30)),
//                                         child: const Center(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 20),
//                                             child: Text(
//                                               "Send Feedback",
//                                               style: TextStyle(
//                                                   fontFamily: 'popins',
//                                                   color: Colors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 // fees == true
//                                 //     ? Container(
//                                 //         height:double.infinity,
//                                 //         width: double.infinity,
//                                 //         color: Colors.blue.withOpacity(0.1),
//                                 //       )
//                                 //     : SizedBox(),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             hide == true
//                                 ? Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.blue.withOpacity(0.2),
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(color: Colors.blue)),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: Get.width / 30,
//                                     vertical: Get.height / 100),
//                                 child: Row(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   children: [
//                                     const Text(
//                                       "Hint : ",
//                                       style: TextStyle(
//                                           color: Colors.blue,
//                                           fontFamily: "popins"),
//                                     ),
//                                     SizedBox(
//                                       width: Get.width / 1.35,
//                                       child: const Text(
//                                         "loream ipsum doller hint ipsum doller hint answer",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontFamily: "popins"),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                                 : const SizedBox()
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               fees == true
//                   ? InkWell(
//                 child: Container(
//                   height: Get.height / 1,
//                   width: Get.width / 1,
//                   color: Colors.blue.withOpacity(0.2),
//                 ),
//                 onTap: () {
//                   setState(() {
//                     fees = false;
//                   });
//                 },
//               )
//                   : SizedBox(),
//               fees == true
//                   ? Positioned(
//                 top: Get.height / 10,
//                 left: 12,
//                 right: 12,
//                 child: Padding(
//                   padding: EdgeInsets.zero,
//                   child: Container(
//                     width: Get.width / 1,
//                     height: Get.height / 1.5,
//                     decoration: BoxDecoration(
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.grey, //New
//                               blurRadius: 25.0,
//                               offset: Offset(1, 5))
//                         ],
//
//                         // boxShadow:BoxShadow(color:Colors.),
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         const Text(
//                           "Report an issue",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "popins Medium",
//                               fontSize: 16),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   one = "ONE";
//                                 });
//                               },
//                               child: Container(
//                                 height: Get.height / 25,
//                                 decoration: BoxDecoration(
//                                     color: one == "ONE"
//                                         ? Colors.blue
//                                         : Colors.grey.withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(30)),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     child: Text(
//                                       "Question unclear",
//                                       style: TextStyle(
//                                           fontFamily: 'popins',
//                                           color: one == "ONE"
//                                               ? Colors.white
//                                               : Colors.grey),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: Get.width / 30,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   one = "TWO";
//                                 });
//                               },
//                               child: Container(
//                                 height: Get.height / 25,
//                                 decoration: BoxDecoration(
//                                     color: one == "TWO"
//                                         ? Colors.blue
//                                         : Colors.grey.withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(30)),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     child: Text(
//                                       "Wrong Answer",
//                                       style: TextStyle(
//                                           fontFamily: 'popins',
//                                           color: one == "TWO"
//                                               ? Colors.white
//                                               : Colors.grey),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   one = "THE";
//                                 });
//                               },
//                               child: Container(
//                                 height: Get.height / 25,
//                                 decoration: BoxDecoration(
//                                     color: one == "THE"
//                                         ? Colors.blue
//                                         : Colors.grey.withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(30)),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     child: Text(
//                                       "Wrong Question",
//                                       style: TextStyle(
//                                           fontFamily: 'popins',
//                                           color: one == "THE"
//                                               ? Colors.white
//                                               : Colors.grey),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: Get.width / 30,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   one = "FOR";
//                                 });
//                               },
//                               child: Container(
//                                 height: Get.height / 25,
//                                 decoration: BoxDecoration(
//                                     color: one == "FOR"
//                                         ? Colors.blue
//                                         : Colors.grey.withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(30)),
//                                 child: Center(
//                                   child: Padding(
//                                     padding:
//                                     EdgeInsets.symmetric(horizontal: 20),
//                                     child: Text(
//                                       "Unclear Image",
//                                       style: TextStyle(
//                                           fontFamily: 'popins',
//                                           color: one == "FOR"
//                                               ? Colors.white
//                                               : Colors.grey),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Container(
//                           height: Get.height / 3.5,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(10)),
//                           width: Get.width /
//                               1.2, //     <-- TextField expands to this height.
//                           child: TextFormField(
//                             style: const TextStyle(
//                               fontFamily: "popins",
//                             ),
//                             // controller: code,
//                             autofocus: false,
//                             maxLines: 10,
//                             decoration: buildInputDecoration(
//                               hintText: "Enter your feedback here",
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               fees = false;
//                             });
//                           },
//                           child: Container(
//                             height: Get.height / 25,
//                             width: Get.width / 3.5,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const Center(
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                                 child: Text(
//                                   "Submit",
//                                   style: TextStyle(
//                                       fontFamily: 'popins',
//                                       color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               fees = false;
//                             });
//                           },
//                           child: Container(
//                             height: Get.height / 25,
//                             width: Get.width / 3.5,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(30)),
//                             child: const Center(
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                                 child: Text(
//                                   "Cancel",
//                                   style: TextStyle(
//                                       fontFamily: 'popins',
//                                       color: Colors.blue),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//                   : SizedBox()
//             ],
//           )),
//     );
//   }
//
//   Future<void> _dialogBuilder(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       barrierColor: Colors.blue.withOpacity(0.2),
//       builder: (BuildContext context) {
//         return Padding(
//             padding: EdgeInsets.symmetric(vertical: Get.height / 4),
//             child: Dialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: Container(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: Get.height / 30,
//                     ),
//                     Container(
//                       height: Get.height / 12,
//                       width: Get.width / 6,
//                       decoration: BoxDecoration(
//                           color: Colors.blue.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(
//                         child: Image.asset(
//                           'asstes/image/Edit.png',
//                           scale: 3.5,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height / 30,
//                     ),
//                     const Text(
//                       "Are you sure you want to exit?",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: "popins Medium",
//                           fontSize: 14),
//                     ),
//                     SizedBox(
//                       width: Get.width / 2.2,
//                       child: const Text(
//                         "You have attempted 2 out  of 15 question",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontFamily: "popins",
//                             fontSize: 12),
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height / 30,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Get.offAll(() => const selectchapters());
//                       },
//                       child: Container(
//                         height: Get.height / 25,
//                         width: Get.width / 3,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(30)),
//                         child: const Center(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             child: Text(
//                               "Exit",
//                               style: TextStyle(
//                                   fontFamily: 'popins', color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height / 40,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           Get.back();
//                         });
//                       },
//                       child: Container(
//                         height: Get.height / 25,
//                         width: Get.width / 3,
//                         decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(30)),
//                         child: const Center(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                   fontFamily: 'popins', color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//       },
//     );
//   }
//
//   InputDecoration buildInputDecoration({
//     String? hintText,
//     prifix,
//     surfix,
//     String? lbltext,
//   }) {
//     return InputDecoration(
//       prefixIcon: prifix,
//       suffixIcon: surfix,
//       hintText: hintText,
//       hintStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
//       labelStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
//       labelText: lbltext,
//       contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//               color: Colors.white,
//               width: 0.5,
//               strokeAlign: StrokeAlign.center)),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15.0),
//         borderSide: const BorderSide(
//           color: Colors.transparent,
//           width: 1,
//         ),
//       ),
//       filled: false,
//     );
//   }
// }
