import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rxn<User?> user = Rxn();
  RxInt income = 2500000.obs;
  RxInt expense = 480000.obs;

  String getIncome() => convertToCurrency(income.value);
  String getExpense() => convertToCurrency(expense.value);
  String getBalance() => convertToCurrency(income.value - expense.value);

  @override
  void onInit() {
    super.onInit();
    user.value = Get.find<AuthController>().getUser();
  }

  RxString selectMode = "month".obs;

  void onModeClick(String newMode) {
    selectMode(newMode);
    update();
  }

  @override
  void onClose() {}
}
