import 'package:dugbet/controllers/home/home_controller.dart';
import 'package:dugbet/controllers/home/wallet_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeWalletController>(() => HomeWalletController());
  }
}
