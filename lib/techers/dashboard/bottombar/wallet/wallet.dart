import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class wallet extends StatefulWidget {
  const wallet({Key? key}) : super(key: key);

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  final _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  bool langauge = true;
  var options;
  List notifi = [
    {"a": "Loream ipsum", "b": "About 1 min ago"},
    {"a": "Ralaable contante page", "b": "About 12 min ago"},
    {"a": "Loream ipsum is not a contant", "b": "About 29 min ago"},
    {"a": "Browse other questions tagged", "b": "29 August"},
    {"a": "Empowering the world", "b": "16 August"},
    {"a": "Loream ipsum doller", "b": "8 August"},
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 80),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InkWell(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const Text(
                    "Subscription",
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
              Expanded(
                child: ListView.builder(
                  // controller: controller,
                  itemCount: notifi.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 30,
                          vertical: Get.height / 80),
                      child: Container(
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
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "Sr.Number",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: "popins Medium"),
                                  ),
                                  Spacer(),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "asstes/image/Placeholder.png",
                                          scale: 2.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Name",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    "STD 11&12 Neet 2022",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "asstes/image/bx_rupee.png",
                                          scale: 2.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Amount",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    "₹ 249",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "asstes/image/Icon-Activity.png",
                                          scale: 2.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Last date",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: "popins"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    "2022-12-08",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                                // rzp_test_Fst0O3RXBEhHnL
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    options = {
                                      'key': 'rzp_test_Fst0O3RXBEhHnL',
                                      'amount': 100,
                                      'name': 'Acme Corp.',
                                      'description': 'Fine T-Shirt',
                                      'prefill': {
                                        'contact': '8888888888',
                                        'email': 'test@razorpay.com'
                                      }
                                    };
                                    print("))))))))))))))))))");
                                    print(options);

                                    try {
                                      _razorpay.open(options);
                                    } catch (e) {
                                      debugPrint(e.toString());
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width / 20,
                                        vertical: 10),
                                    child: const Text(
                                      "Subscribe Now",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: "popins"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment SUCSEES @@@@@@@@@@@@@@@@@@@@@@@");
    print(response);
    print(options.toString());
    print(response.paymentId);
    _dialogBuilder(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment FAILES @@@@@@@@@@@@@@@@@@@@@@@@");
    dialogBuilder(context);
  }

  void _handleExternalWallet(PaymentSuccessResponse response) {
    print("Payment WALLET @@@@@@@@@@@@@@@@@@@@@@@@");
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.blue.withOpacity(0.2),
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 4),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green.withOpacity(0.2),
                        child: const Center(
                          child: Icon(
                            Icons.done_all,
                            size: 50,
                            color: Colors.green,
                          ),
                        )),
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    const Text(
                      "SUCCESS",
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: "popins Bold",
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: const Text(
                        "Dear Saumil Vekariya your STD 11&12 Neet 2022 subscription has been subscribed.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "popins",
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 40,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Get.back();
                        });
                      },
                      child: Container(
                        height: Get.height / 25,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  fontFamily: 'popins', color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.blue.withOpacity(0.2),
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 4),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                    Image.asset(
                      'asstes/image/payment_fail_icon.png',
                      scale: 4.5,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Payment Failed",
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: "popins Bold",
                          fontSize: 20),
                    ),
                    // SizedBox(
                    //   width: Get.width / 1.5,
                    //   child: const Text(
                    //     "Sorry your payment is failed",
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //         color: Colors.grey,
                    //         fontFamily: "popins",
                    //         fontSize: 12),
                    //   ),
                    // ),
                    SizedBox(
                      height: Get.height / 40,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Get.back();
                          try {
                            _razorpay.open(options);
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                        });
                      },
                      child: Container(
                        height: Get.height / 25,
                        width: Get.width / 3,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Try again",
                              style: TextStyle(
                                  fontFamily: 'popins', color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 40,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     setState(() {
                    //       Get.back();
                    //     });
                    //   },
                    //   child: Container(
                    //     height: Get.height / 25,
                    //     width: Get.width / 3,
                    //     decoration: BoxDecoration(
                    //         color: Colors.grey.withOpacity(0.2),
                    //         borderRadius: BorderRadius.circular(30)),
                    //     child: const Center(
                    //       child: Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 20),
                    //         child: Text(
                    //           "Try Later",
                    //           style: TextStyle(
                    //               fontFamily: 'popins', color: Colors.black),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
