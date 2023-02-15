// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiWrapper {
  static var headers = {'X-Authorization': 'e562823edfaadbef52b6f5b91616645b'};
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
}
