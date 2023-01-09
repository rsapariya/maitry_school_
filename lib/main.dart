import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:schooolapp/units/color.dart';

import 'login/mainscreen.dart';
import 'onbording.dart';

void main() async {
  await GetStorage.init();
  runApp(provider());
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
        home: BoardingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
