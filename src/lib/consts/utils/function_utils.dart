import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String convertToCurrency(int value) {
  // convert from int to string using NumberFormat
  // example 1000 -> 1.000, 1000000 -> 1.000.000
  return '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(value)} ';
}

void navigateToTransactionPage() {
  if (Get.isRegistered<TransactionController>()) {
    final controller = Get.find<TransactionController>();
    controller.isEdit.value = false;
    controller.newTransaction.value = true;
    controller.titleTextEdit.text = "New Transaction";
    controller.descriptionTextEdit.text = "";
    controller.incomeTextEdit.text = convertToCurrency(0);
  } else {
    final controller = Get.put<TransactionController>(TransactionController());
    controller.isEdit.value = false;
    controller.newTransaction.value = true;
    controller.titleTextEdit.text = "New Transaction";
    controller.descriptionTextEdit.text = "";
    controller.incomeTextEdit.text = convertToCurrency(0);
  }

  Get.toNamed(AppPage.transactionPage);
}
