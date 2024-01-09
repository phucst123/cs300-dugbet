import 'package:dugbet/consts/app_export.dart';
import 'package:get/get.dart';

//import '../..firebase_ref/references.dart';
class WalletPersonalController extends GetxController {
  RxString selectMode = "month".obs;
  void onModeClick(String newMode) {
    selectMode(newMode);
    if (newMode == "today") {
      DateTime now = DateTime.now();
      DateTime startOfToday = DateTime(now.year, now.month, now.day);
      DateTime endOfToday = DateTime(now.year, now.month, now.day + 1);
    } else if (newMode == "week") {
      // displayTransactionList = filterTransactionsByCurrentWeek();
    } else if (newMode == "month") {
      // displayTransactionList = filterTransactionsByCurrentMonth();
    } else if (newMode == "quarter") {
      // displayTransactionList = filterTransactionsByCurrentQuarter();
    } else if (newMode == "year") {
      // displayTransactionList = filterTransactionsByCurrentYear();
    }
    // update income and expense
    // displayIncome.value = 0;
    // displayExpense.value = 0;
    // for (var transaction in displayTransactionList) {
    // if (transaction.type == 1) {
    // displayIncome.value += transaction.amount;
    // } else {
    // displayExpense.value += transaction.amount;
    // }

    update();
  }

  @override
  void onClose() {}
}
