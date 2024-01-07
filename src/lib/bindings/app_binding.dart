import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/controllers/login/login_controller.dart';
import 'package:dugbet/controllers/login/password_controller.dart';
import 'package:dugbet/controllers/login/signup_controller.dart';
import 'package:dugbet/controllers/splash/loading_controller.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => LoadingController());
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<PasswordController>(() => PasswordController(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
    Get.lazyPut(() => TransactionHistoryController());
  }
}
