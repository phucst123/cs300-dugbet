import 'package:get/get.dart';

class TransactionChartController extends GetxController {
  RxString selectMode = "month".obs;

  void onModeClick(String newMode) {
    selectMode(newMode);
    update();
  }

  @override
  void onClose() {}
}
