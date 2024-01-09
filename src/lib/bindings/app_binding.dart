import 'package:dugbet/controllers/home/home_controller.dart';
import 'package:dugbet/controllers/home/wallet_controller.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/controllers/setting/setting_controller.dart';
import 'package:dugbet/controllers/splash/loading_controller.dart';
import 'package:dugbet/controllers/wallet/wallet_personal_controller.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_overview/transaction_chart_controller.dart';
import 'package:dugbet/controllers/wallet/wallet_controller.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(() => WalletController());
    //Get.put<WalletController>(WalletController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeWalletController());
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => WalletPersonalController());
    Get.lazyPut<TransactionHistoryController>(
        () => TransactionHistoryController(),
        fenix: true);
    Get.lazyPut<TransactionChartController>(() => TransactionChartController(),
        fenix: true);
  }
}
