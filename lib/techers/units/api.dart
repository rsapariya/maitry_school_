// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../student/bottoms.dart';

var headers = {'X-Authorization': Xapi.toString()};

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
      print(url);
      print(method);
      var request =
          await http.post(url, headers: headers, body: jsonEncode(method));
      var response = jsonDecode(request.body);
      print("response----- $response");
      if (request.statusCode == 200) {
        print(response);
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
        print(request.reasonPhrase);
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
        print(request.reasonPhrase);
      }
    } catch (e) {
      print("Exeption----- $e");
    }
  }
}

class AppUrl {
  static const String baseurl = 'https://maitriapp.in/api/v1';
  static const String login = baseurl + '/login';
  static const String Signup = baseurl + '/signup';
  static const String Chapter = baseurl + '/chapter/1';
  static const String Tpoic = baseurl + '/topic';
  static const String MCqs = baseurl + '/mcqs';
  static const String Sendrequest = baseurl + '/send_request';
  static const String getrequest = baseurl + '/allrequest';
  static const String chagepass = baseurl + '/change_password';
  static const String decline = baseurl + '/request_decline';
  static const String getsubscribeT =
      baseurl + '/getsubscriptionplan?type=Teacher';
  static const String getsubscribeS =
      baseurl + '/getsubscriptionplan?type=Student';
  static const String getclass = baseurl + '/allclass';
  static const String Creatclass = baseurl + '/create_class';
  static const String Deleteclass = baseurl + '/class_delete/';
  static const String Aboutapp = baseurl + '/aboutapp';
  static const String Acceptrequets = baseurl + '/request_accept';
  static const String addstuclass = baseurl + '/addstudent_inclass';
  static const String getoffers = baseurl + '/getoffers';
  static const String getexam = baseurl + '/allexam_bystudent/';
  static const String getstudntbyclass = baseurl + '/student_byclass/';
  static const String deletestudent = baseurl + '/stud_delete_inclass/';
}
