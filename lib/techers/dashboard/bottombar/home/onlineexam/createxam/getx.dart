import 'package:get/get.dart';
import 'package:schooolapp/techers/dashboard/bottombar/home/onlineexam/createxam/viewexam.dart';

class HomePageController extends GetxController {
  RxInt No = 0.obs;
  RxInt totelmark = 0.obs;

  Totel() {
    No = int.parse(quesNo.text).obs;

    totelmark = ((No.value) * 10).obs;
  }
}
