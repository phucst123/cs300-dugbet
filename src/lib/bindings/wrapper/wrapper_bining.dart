import 'package:dugbet/controllers/home/home_controller.dart';
import 'package:dugbet/controllers/home/wallet_controller.dart';
import 'package:dugbet/controllers/transaction/transaction_chart_controller.dart';
import 'package:dugbet/controllers/wrapper/wrapper_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:get/get.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WrapperController>(() => WrapperController());

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeWalletController>(() => HomeWalletController());
    
    Get.lazyPut<TransactionChartController>(() => TransactionChartController());
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
