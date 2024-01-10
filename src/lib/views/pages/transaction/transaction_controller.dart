import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_controller.dart';
import 'package:dugbet/views/widgets/choose_list_wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TextEditingController incomeTextEdit = TextEditingController();
  final TextEditingController descriptionTextEdit = TextEditingController();
  final TextEditingController titleTextEdit = TextEditingController();
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  var selectedWallet = "Momo".obs;
  var isIncome = true.obs;
  var isEdit = false.obs;
  var title = "snack".obs;
  var category = "Food and beverages".obs;
  var icon = "snack.svg".obs;
  var type = 0.obs;
  RxBool newTransaction = false.obs;

  // Rx<TransactionModel> transaction = TransactionModel(
  //   transactionId: '0',
  //   title: "New Transaction",
  //   isIncome: false,
  //   type: "Personal",
  //   category: "food_beverages",
  //   subCategory: "fine_dining",
  //   amount: 100000,
  //   description: "...",
  //   date: DateTime.now(),
  //   payerId: 'demo@gmail.com',
  //   walletId: '0',
  //   members: [],
  // ).obs;

  late User? user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = Get.find<AuthController>().getUser();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    incomeTextEdit.dispose();
    descriptionTextEdit.dispose();
    titleTextEdit.dispose();
  }

  chooseTime() async {
    TimeOfDay? pickTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
    );
    if (pickTime != null && pickTime != selectedTime.value) {
      selectedTime.value = pickTime;
    }
  }

  chooseDate() async {
    DateTime? pickDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (pickDate != null && pickDate != selectedDate.value) {
      selectedDate.value = pickDate;
    }
  }

  chooseWallet() {
    Get.dialog(SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: const ChooseListWallet()),
      ),
    ));
  }

  Future<void> pushToFirestore() async {
    if (newTransaction.value) {
      String? user_id = user!.email;
      String? user_name = user!.displayName;
      DateTime now = DateTime.now();
      usersRef.doc(user_id).collection('Transactions').add({
        'amount': int.parse(incomeTextEdit.text),
        'category': category.value,
        'date': DateTime(
            selectedDate.value.year,
            selectedDate.value.month,
            selectedDate.value.day,
            selectedTime.value.hour,
            selectedTime.value.minute),
        'description': descriptionTextEdit.text,
        'isIncome': isIncome.value,
        'payerId': user_id,
        'subCategory': title.value,
        'title': titleTextEdit.text,
        'transactionId':
            '${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-${now.second}-${user_id}',
        'type': 'Personal',
        'walletId':
            "${user_name!.toLowerCase()}-${selectedWallet.value.toLowerCase()}"
      }).whenComplete(
          () => Get.snackbar("Transaction", "Add Transaction Successfully"));
          
      var ctl = Get.find<TransactionHistoryController>();
      await ctl.getTransactionsData();
    }
  }
}
