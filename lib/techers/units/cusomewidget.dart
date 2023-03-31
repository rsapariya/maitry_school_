// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'media.dart';

//============================== Appbar ===========================================

appbar({String? tital, Color? txtclr, Color? iconclr}) {
  return AppBar(
    title: Text(
      tital!,
      style: TextStyle(
        color: txtclr,
        fontSize: height / 40,
      ),
    ),
    leading: InkWell(
      onTap: () => Get.back(),
      child: Container(
        height: height / 20,
        width: width / 4,
        decoration: BoxDecoration(
          color: Colors.pink,
          border: Border.all(
            color: const Color(0xff8C949C).withOpacity(0.4),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Icon(Icons.arrow_back, size: height / 40, color: iconclr),
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

//============================== button ============================================

appButton({Function()? onTap, String? title, Color? clr}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.only(
          bottom: 10, left: Get.width / 10, right: Get.width / 10),
      child: Container(
        height: Get.height / 16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.blue),
        child: Center(
          child: Text(
            title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'popins Medium',
            ),
          ),
        ),
      ),
    ),
  );
}

loding() {
  return InkWell(
    child: Padding(
      padding: EdgeInsets.only(
          bottom: 10, left: Get.width / 10, right: Get.width / 10),
      child: Container(
        height: Get.height / 16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.blue),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
        ),
      ),
    ),
  );
}

//================================== Textfield ======================================

textField({
  String? hinttext,
  String? labeltxt,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width / 20),
    child: Container(
      height: height / 15,
      color: Colors.transparent,
      child: TextField(
        style: TextStyle(
          fontSize: height / 50,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labeltxt,
          labelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5), fontSize: height / 50),
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: height / 55,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

CustomAppbar(
    {String? centertext,
    bool? center,
    IconData? actionicon,
    Function()? onclick,
    double? redi}) {
  return AppBar(
    elevation: 800,
    backgroundColor: Colors.white,
    centerTitle: center,
    title: Text(centertext!,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontFamily: "Gilroy Bold")),
    leading: Transform.translate(
      offset: const Offset(-6, 0),
      child: const BackButton(color: Colors.black),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: onclick,
          child: CircleAvatar(
            radius: redi,
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: Icon(
              actionicon,
              color: Colors.black,
            ),
          ),
        ),
      )
    ],
  );
}

// \\======================================================================================

textfield(
    {String? text,
    suffix,
    Color? labelcolor,
    feildcolor,
    Color? tclr,
    double? Width,
    TextEditingController? controller,
    Height}) {
  return Container(
      height: Height,
      width: Width,
      padding: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: feildcolor),
      child: TextField(
        style: TextStyle(color: tclr),
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
              color: Colors.grey, fontFamily: "Gilroy Medium", fontSize: 15),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(6),
            child: suffix,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
      ));
}

// \\=====================================================================

Button({String? buttontext, Function()? onclick, IconData? icon}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.deepOrange),
      child: Center(
          child: Row(
        children: [
          Text(
            buttontext!.toUpperCase(),
            style: const TextStyle(
                fontFamily: "Gilroy Bold", color: Colors.white, fontSize: 16),
          ),
          Icon(icon)
        ],
      )),
    ),
  );
}

//============================================================================================================

appbare(
    {String? tital,
    Color? txtclr,
    Color? iconclr,
    Color? butclr,
    Color? brclr}) {
  return AppBar(
    title: Padding(
      padding: EdgeInsets.only(top: height / 90),
      child: Text(
        tital!,
        style: TextStyle(
          color: txtclr,
          fontSize: height / 40,
        ),
      ),
    ),
    leading: InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: EdgeInsets.only(left: width / 30, top: height / 80),
        child: Container(
          height: height / 25,
          // width: width / ,
          decoration: BoxDecoration(
            color: butclr,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: width / 40),
            child:
                Icon(Icons.arrow_back_ios, size: height / 40, color: iconclr),
          ),
        ),
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

//===============================================
Butten({
  String? buttontext,
  Function()? onclick,
}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blue),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttontext!,
            style: const TextStyle(
                fontFamily: "Gilroy Bold", color: Colors.white, fontSize: 16),
          ),
        ],
      )),
    ),
  );
}

//==============================================
Buttenn({IconData? icon, String? txt, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.blue),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt!,
            style: const TextStyle(
                fontFamily: "Gilroy Bold", color: Colors.white, fontSize: 16),
          ),
          SizedBox(width: width / 20),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      )),
    ),
  );
}
//==============================================

user(
    {String? hinttext,
    String? labeltxt,
    Color? brc,
    Color? lclr,
    required TextInputType? keyboardType,
    required TextEditingController? controller,
    Color? txclr,
    Widget? suffixIcon}) {
  return Container(
    height: height / 15,
    color: Colors.transparent,
    child: TextField(
      keyboardType: keyboardType,
      controller: controller,
      style: TextStyle(
        fontSize: height / 50,
        color: txclr,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: lclr, fontSize: height / 50),
        hintText: hinttext,
        hintStyle: TextStyle(
          color: lclr,
          fontSize: height / 55,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: brc!),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: brc,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

//====================================================

mobile(
    {String? hinttext,
    String? labeltxt,
    Color? brc,
    double? widt,
    required TextEditingController? controller,
    Color? lclr,
    required TextInputType? keyboardType,
    Color? txclr,
    bool readOnly = false,
    Widget? suffixIcon}) {
  return Container(
    height: height / 15,
    width: width / 1.65,
    color: Colors.transparent,
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: height / 50,
        color: txclr,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: lclr, fontSize: height / 50),
        hintText: hinttext,
        hintStyle: TextStyle(
          color: lclr,
          fontSize: height / 55,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: brc!),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: brc,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

//========================

addadress(
    {String? hinttext,
    String? labeltxt,
    Color? brc,
    double? widt,
    required TextEditingController? controller,
    Color? lclr,
    required TextInputType? keyboardType,
    Color? txclr,
    bool readOnly = false,
    Widget? suffixIcon}) {
  return Container(
    height: height / 15,
    color: Colors.transparent,
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: height / 50,
        color: txclr,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labeltxt,
        labelStyle: TextStyle(color: lclr, fontSize: height / 50),
        hintText: hinttext,
        hintStyle: TextStyle(
          color: lclr,
          fontSize: height / 55,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: brc!),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: brc,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
