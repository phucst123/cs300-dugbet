import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/home/home_controller.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:dugbet/models/TransactionModel.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

//import '../..firebase_ref/references.dart';
class WalletPersonalController extends GetxController {
  late User? user;
  RxString selectMode = "month".obs;
  List<TransactionTemplate> transactionlist = [];
  List<TransactionTemplate> displayTransactionList = [];
  var transactionListModel = <TransactionModel>[];
  RxInt displayIncome = 0.obs;
  RxInt displayExpense = 0.obs;
  RxInt displayBalance = 0.obs;
  var isLoadingTransaction = true.obs;
  var walletNameID = "".obs;
  RxInt income = 0.obs;
  RxInt expense = 0.obs;
  RxInt balance = 0.obs;
  @override
  void onInit() {
    super.onInit();
    user = Get.find<AuthController>().getUser();
  }

  void changeMode(String newMode) {
    if (newMode == selectMode.value) return;
    selectMode.value = newMode;
    isLoadingTransaction.value = true;
  }


  void chooseWallet(String walletName) {
    print('what wallet: ${walletName}');
    print('current wallet: ${walletNameID.value}');
    if (walletNameID.value == walletName) return;
    walletNameID.value = walletName;
    isLoadingTransaction.value = true;
    getTransactions();

  }

  void loadingData() {
    isLoadingTransaction.value = true;
  }

  List<TransactionTemplate> filterTransactionsByDate(
      DateTime startDate, DateTime endDate) {
    return transactionlist
        .where((transaction) =>
            transaction.date.isAfter(startDate.subtract(Duration(days: 1))) &&
            transaction.date.isBefore(endDate.add(Duration(days: 1))))
        .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek =
        now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

    return transactionlist
        .where((transaction) =>
            transaction.date.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
            transaction.date.isBefore(endOfWeek.add(Duration(days: 1))))
        .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentMonth() {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);

    return transactionlist
        .where((transaction) =>
            transaction.date
                .isAfter(startOfMonth.subtract(Duration(days: 1))) &&
            transaction.date.isBefore(endOfMonth.add(Duration(days: 1))))
        .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentYear() {
    DateTime now = DateTime.now();
    DateTime startOfYear = DateTime(now.year, 1, 1);
    DateTime endOfYear = DateTime(now.year + 1, 1, 0);

    return transactionlist
        .where((transaction) =>
            transaction.date.isAfter(startOfYear.subtract(Duration(days: 1))) &&
            transaction.date.isBefore(endOfYear.add(Duration(days: 1))))
        .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentQuarter() {
    DateTime now = DateTime.now();
    int currentQuarter = (now.month - 1) ~/ 3 + 1;
    DateTime startOfQuarter =
        DateTime(now.year, (currentQuarter - 1) * 3 + 1, 1);
    DateTime endOfQuarter = DateTime(now.year, currentQuarter * 3, 0);

    return transactionlist
        .where((transaction) =>
            transaction.date
                .isAfter(startOfQuarter.subtract(Duration(days: 1))) &&
            transaction.date.isBefore(endOfQuarter.add(Duration(days: 1))))
        .toList();
  }

  void onModeClick(String newMode) {
    selectMode(newMode);
    if (newMode == "today") {
      DateTime now = DateTime.now();
      DateTime startOfToday = DateTime(now.year, now.month, now.day);
      DateTime endOfToday = DateTime(now.year, now.month, now.day + 1);
      displayTransactionList =
          filterTransactionsByDate(startOfToday, endOfToday);
    } else if (newMode == "week") {
      displayTransactionList = filterTransactionsByCurrentWeek();
    } else if (newMode == "month") {
      displayTransactionList = filterTransactionsByCurrentMonth();
    } else if (newMode == "quarter") {
      displayTransactionList = filterTransactionsByCurrentQuarter();
    } else if (newMode == "year") {
      displayTransactionList = filterTransactionsByCurrentYear();
    }
    // update income and expense
    displayIncome.value = 0;
    displayExpense.value = 0;
    displayBalance.value = 0;
    for (var transaction in displayTransactionList) {
      if (transaction.type == 1) {
        displayIncome.value += transaction.amount;
      } else {
        displayExpense.value += transaction.amount;
      }
    }
    displayBalance.value = displayIncome.value - displayExpense.value;
    update();
  }

  Future<void> getTransactions() async {
    if (isLoadingTransaction.value) {
      isLoadingTransaction.value = false;
    } 
    else return;
    print('im here to read wallet transaction');
    String? user_id = user!.email;
    try {
      QuerySnapshot transactions = await usersRef
          .doc(user_id)
          .collection('Transactions')
          .get();
      transactionListModel.clear();
      transactionlist.clear();
      income.value = 0;
      expense.value = 0;
      balance.value = 0;
      for (var transaction in transactions.docs) {
        if (transaction['walletId'] != walletNameID.value) continue;
        //print("im here to read ${transaction.data()}");
        transactionListModel.add(TransactionModel.fromDocumentSnapshot(
            documentSnapshot: transaction));
        transactionlist.add(TransactionTemplate(
          category: transaction['category'],
          title: transaction['title'],
          description: transaction['description'],
          // from Minh: Vinh hay Binh code cho nay thi fix lai gium tui nhe. Tui tam thoi comment de tranh error
          //amount: convertToCurrency(transaction['amount']),
          amount: transaction['amount'],
          // convert to DateTime from Timestamp
          date: transaction['date'].toDate(),

          ///transaction['date'].toDate(),
          icon: transaction['subCategory'],
          type: transaction['isIncome'] ? 1 : 0,
        ));
        // convert to int amount from number to int
        if (transaction['isIncome']) {
          income.value +=
              double.parse(transaction['amount'].toString()).toInt();
        } else {
          expense.value +=
              double.parse(transaction['amount'].toString()).toInt();
        }
        balance.value = income.value - expense.value;
        // displayIncome.value = 0;
        // displayExpense.value = 0;
        // for (var transaction in transactionlist) {
        //   if (transaction.type == 1) {
        //     displayIncome.value += transaction.amount;
        //   } else {
        //     displayExpense.value += transaction.amount;
        //   }
        // }
      }
      onModeClick(selectMode.value);
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting transaction list',
          snackPosition: SnackPosition.BOTTOM);
    }


    // get transactionlist from home_controller
    // var temp_transactionlist = Get.find<HomeController>().transactionListModel;
    // transactionlist.clear();
    // income.value = 0;
    // expense.value = 0;
    // balance.value = 0;
    // for (var transaction in temp_transactionlist) {
    //   if (transaction.walletId == walletNameID.value) {
    //     transactionlist.add(TransactionTemplate(
    //       category: transaction.category,
    //       title: transaction.title,
    //       description: transaction.description,
    //       amount: transaction.amount,
    //       date: transaction.date,
    //       icon: 'snack.svg',
    //       type: transaction.isIncome ? 1 : 0,
    //     ));
    //     // convert to int amount from number to int
    //     if (transaction.isIncome) {
    //       income.value += transaction.amount;
    //     } else {
    //       expense.value += transaction.amount;
    //     }
    //   }
    //}
    //onModeClick(selectMode.value);
  }

  @override
  void onClose() {}
}
