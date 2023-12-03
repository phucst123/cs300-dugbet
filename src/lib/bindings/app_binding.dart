import 'package:dugbet/controllers/splash/loading_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingController());
  }
}
