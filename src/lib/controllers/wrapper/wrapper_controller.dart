import 'package:get/get.dart';

class WrapperController extends GetxController {
  RxInt tabIndex = 0.obs;

  void onTabClick(int newTab) {
    // print('Tab $newTab');
    tabIndex(newTab);
  }

  @override
  void onClose() {}
}
