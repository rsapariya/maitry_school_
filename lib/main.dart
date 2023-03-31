// ignore_for_file: camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:schooolapp/student/bottoms.dart';
import 'package:schooolapp/techers/dashboard/bottombar/bottombar.dart';
import 'package:schooolapp/techers/units/color.dart';
import 'package:schooolapp/techers/units/storage.dart';
import 'onbording.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const provider());
}

class provider extends StatelessWidget {
  const provider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
      ],
      child: GetMaterialApp(
        home: getdata.read('islogin') != true
            ? const BoardingPage()
            : getdata.read('logindata')['Result']['user_type'] == "Student"
                ? const bottoms()
                : const bottomt(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
