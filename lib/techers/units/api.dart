// ignore_for_file: non_constant_identifier_names, empty_catches, constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../student/bottoms.dart';
import '../login/mainscreen.dart';


class ApiWrapper {
  static fluttertosat(msj) async {
    Fluttertoast.showToast(
        msg: msj,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static doImageUpload(
      String endpoint, Map<String, String> params, List imgs) async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.baseurl));
    request.fields.addAll(params);
    for (int i = 0; i < imgs.length; i++) {
      log(imgs[i].toString(), name: "Image name $i");
      request.files.add(await http.MultipartFile.fromPath('image$i', imgs[i]));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var model = await response.stream.bytesToString();
    return jsonDecode(model);
  }

  static dataPost(appUrl, method) async {
    try {
      var url = Uri.parse(appUrl);
      var request =
          await http.post(url, headers: headers, body: jsonEncode(method));
      var response = jsonDecode(request.body);
      if (request.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      return e;
    }
  }

  static dataGet(appUrl) async {
    try {
      var url = Uri.parse(appUrl);
      var request = await http.get(url, headers: headers);
      var response = jsonDecode(request.body);
      if (request.statusCode == 200) {
        return response;
      } else {
      }
    } catch (e) {
      return e;
    }
  }

  static dataGetLocation(appUrl) async {
    try {
      var request = await http.get(appUrl, headers: headers);
      var response = jsonDecode(request.body);
      if (request.statusCode == 200) {
        return response;
      } else {
      }
    } catch (e) {
    }
  }
}

class AppUrl {
  static const String baseurl = 'https://maitriapp.in/api_new/v1';
  static const String login = '$baseurl/login';
  static const String Signup = '$baseurl/signup';
  static const String Chapter = '$baseurl/chapter/1';
  static const String Tpoic = '$baseurl/topic';
  static const String MCqs = '$baseurl/mcqs';
  static const String Sendrequest = '$baseurl/send_request';
  static const String getrequest = '$baseurl/allrequest';
  static const String chagepass = '$baseurl/change_password';
  static const String decline = '$baseurl/request_decline';
  static const String getsubscribeT =
      '$baseurl/getsubscriptionplan?type=Teacher';
  static const String getsubscribeS =
      '$baseurl/getsubscriptionplan?type=Student';
  static const String getclass = '$baseurl/allclass';
  static const String Creatclass = '$baseurl/create_class';
  static const String Deleteclass = '$baseurl/class_delete/';
  static const String Aboutapp = '$baseurl/aboutapp';
  static const String Acceptrequets = '$baseurl/request_accept';
  static const String addstuclass = '$baseurl/addstudent_inclass';
  static const String getoffers = '$baseurl/getoffers';
  static const String getexam = '$baseurl/allexam_bystudent/';
  static const String getstudntbyclass = '$baseurl/student_byclass/';
  static const String deletestudent = '$baseurl/stud_delete_inclass/';
  static const String dateresult = '$baseurl/datewise_exam';
  static const String allexamtech = '$baseurl/getexam_teacher';
  static const String CreEAXM = '$baseurl/exam';
  static const String Forgot = '$baseurl/send_otp';
  static const String PostTest = '$baseurl/test';
  static const String AllTestApi = '$baseurl/alltest';
  static const String Result = '$baseurl/test_result/';
  static const String Getchapter = '$baseurl/chapter';
  static const String Materials = '$baseurl/materials';
  static const String Mcqchap = '$baseurl/auto_exam_chapter/';
  static const String Mcqtopic = '$baseurl/auto_exam_question/';
  static const String Getmcq = '$baseurl/getexam_mcqs/';
  static const String GetNotification = '$baseurl/notifications';
}
