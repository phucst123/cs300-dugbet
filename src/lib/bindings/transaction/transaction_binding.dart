import 'package:dugbet/controllers/home/home_controller.dart';
import 'package:dugbet/controllers/transaction/transaction_chart_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:get/get.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
    Get.lazyPut<TransactionChartController>(() => TransactionChartController());
  }
}
