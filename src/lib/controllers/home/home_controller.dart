import 'dart:async';

import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:dugbet/models/TransactionModel.dart';
import 'package:dugbet/firebase_ref/references.dart';
//import '../..firebase_ref/references.dart';
class HomeController extends GetxController {
  StreamSubscription? _walletSubscription;
  Rxn<User?> user = Rxn();
  RxInt income = 2500000.obs;
  RxInt expense = 480000.obs;
  RxString selectMode = "month".obs;
  List<TransactionTemplate> transactionlist = [];
  List<TransactionTemplate> displayTransactionList = [];
  RxInt displayIncome = 0.obs;
  RxInt displayExpense = 0.obs;
  RxList<WalletModel> walletData = <WalletModel>[].obs;
  RxInt balance = 0.obs;
  var isLoadingWallet = true.obs;
  var isLoadingTransaction = true.obs;
  var transactionListModel = <TransactionModel>[];
  @override
  void onInit() {
    // getWallets();
    user.value = Get.find<AuthController>().getUser();
    super.onInit();
    getWallets();
    //transactionlist = getTransactionList();
    getTransactions();
  }

  void loadingData() {
    isLoadingWallet.value = true;
    isLoadingTransaction.value = true;
  }

  Future<void> getWallets() async {
    if (isLoadingWallet.value) {
      isLoadingWallet.value = false;
    }
    else return;
    String? user_id = user.value!.email;
    print('im here to read wallet homepage');
    try {
      QuerySnapshot wallets = await usersRef.doc(user_id).collection('Wallets')
          .get();
      walletData.clear();
      balance.value = 0;
      for (var wallet in wallets.docs) {
        //print("im here to read ${wallet.data()}");
        walletData
            .add(WalletModel.fromDocumentSnapshot(documentSnapshot: wallet));
        balance.value +=
            double.parse(wallet['initialAmount'].toString()).toInt()
            + double.parse(wallet['income'].toString()).toInt()
            - double.parse(wallet['expense'].toString()).toInt();
      }
       update();
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting wallet list',
          snackPosition: SnackPosition.BOTTOM);
    }
    
    update();
  }

  Future<void> getTransactions() async {
    if (isLoadingTransaction.value) {
      isLoadingTransaction.value = false;
    }
    else return;
    print('im here to read transaction homepage');
    String? user_id = user.value!.email;
    try {
      QuerySnapshot transactions = await usersRef.doc(user_id)
          .collection('Transactions')
          .get();
      transactionListModel.clear();
      transactionlist.clear();
      income.value = 0;
      expense.value = 0;
      // transactionlist.add(TransactionTemplate(
      //     category: "Fnb",
      //     title: "Snack",
      //     description: "Income from design project",
      //     amount: 25000,
      //     date: DateTime(2024, 1, 8),
      //     icon: "snack.svg",
      //     type: 1));
      // income.value += 25000;
      // transactionlist.add(TransactionTemplate(
      //     category: "Clothing",
      //     title: "Rent payment",
      
      //     description: "Monthly rent payment",
      //     amount: 15000,
      //     date: DateTime.now(),
      //     icon: "socks.svg",
      //     type: 0));
      // expense.value += 15000;
      for (var transaction in transactions.docs) {
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
        //print('category: ${transaction['category']}, icon: ${transaction['subCategory']}');
        // convert to int amount from number to int
        if (transaction['isIncome']) {
          income.value +=
              double.parse(transaction['amount'].toString()).toInt();
        } else {
          expense.value +=
              double.parse(transaction['amount'].toString()).toInt();
        }
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
  } 

  List<TransactionTemplate> filterTransactionsByDate(DateTime startDate, DateTime endDate) {
    return transactionlist
      .where((transaction) =>
        transaction.date.isAfter(startDate.subtract(Duration(days: 1))) &&
        transaction.date.isBefore(endDate.add(Duration(days: 1))))
      .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

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
        transaction.date.isAfter(startOfMonth.subtract(Duration(days: 1))) &&
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
    DateTime startOfQuarter = DateTime(now.year, (currentQuarter - 1) * 3 + 1, 1);
    DateTime endOfQuarter = DateTime(now.year, currentQuarter * 3, 0);

    return transactionlist
      .where((transaction) =>
        transaction.date.isAfter(startOfQuarter.subtract(Duration(days: 1))) &&
        transaction.date.isBefore(endOfQuarter.add(Duration(days: 1))))
      .toList();
  }

  void onModeClick(String newMode) {
    selectMode(newMode);
    if (newMode == "today") {
      DateTime now = DateTime.now();
      DateTime startOfToday = DateTime(now.year, now.month, now.day);
      DateTime endOfToday = DateTime(now.year, now.month, now.day + 1);
      displayTransactionList = filterTransactionsByDate(startOfToday, endOfToday);
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
    for (var transaction in displayTransactionList) {
      if (transaction.type == 1) {
        displayIncome.value += transaction.amount;
      } else {
        displayExpense.value += transaction.amount;
      }
    }
    update();
  }


  List<TransactionTemplate> getTransactionList() {
    return [
      TransactionTemplate(
          category: "Fnb",
          title: "Snack",
          description: "Income from design project",
          amount: 5,
          date: DateTime.now(),
          icon: "snack.svg",
          type: 1),
      TransactionTemplate(
          category: "Clothing",
          title: "Rent payment",
          description: "Monthly rent payment",
          amount: 1000000,
          date: DateTime.now(),
          icon: "socks.svg",
          type: 0),
      // TransactionTemplate(
      //     title: "Grocery shopping",
      //     description: "Purchased groceries",
      //     amount: "50.000",
      //     date: DateTime.now(),
      //     icon: Icons.shopping_cart,
      //     type: 0),
      // TransactionTemplate(
      //     title: "Salary",
      //     description: "Monthly salary",
      //     amount: "3.000.000",
      //     date: DateTime.now(),
      //     icon: Icons.attach_money,
      //     type: 1),
      // TransactionTemplate(
      //     title: "Restaurant bill",
      //     description: "Dinner at a fancy restaurant",
      //     amount: "200.000",
      //     date: DateTime.now(),
      //     icon: Icons.restaurant,
      //     type: 0),
      // TransactionTemplate(
      //     title: "Design income",
      //     description: "Income from design project",
      //     amount: "500.000",
      //     date: DateTime.now().add(const Duration(days: -1)),
      //     icon: Icons.design_services,
      //     type: 1),
      // TransactionTemplate(
      //     title: "Rent payment",
      //     description: "Monthly rent payment",
      //     amount: "1.000.000",
      //     date: DateTime.now().add(const Duration(days: -1)),
      //     icon: Icons.home,
      //     type: 0),
      // TransactionTemplate(
      //     title: "Grocery shopping",
      //     description: "Purchased groceries",
      //     amount: "50.000",
      //     date: DateTime.now().add(const Duration(days: -1)),
      //     icon: Icons.shopping_cart,
      //     type: 0),
      // TransactionTemplate(
      //     title: "Salary",
      //     description: "Monthly salary",
      //     amount: "3.000.000",
      //     date: DateTime.now().add(const Duration(days: -1)),
      //     icon: Icons.attach_money,
      //     type: 1),
      // TransactionTemplate(
      //     title: "Restaurant bill",
      //     description: "Dinner at a fancy restaurant",
      //     amount: "200.000",
      //     date: DateTime.now().add(const Duration(days: -1)),
      //     icon: Icons.restaurant,
      //     type: 0),
      // TransactionTemplate(
      //     title: "Design income",
      //     description: "Income from design project",
      //     amount: "500.000",
      //     date: DateTime.now().add(const Duration(days: -2)),
      //     icon: Icons.design_services,
      //     type: 1),
      // TransactionTemplate(
      //     title: "Rent payment",
      //     description: "Monthly rent payment",
      //     amount: "1.000.000",
      //     date: DateTime.now().add(const Duration(days: -2)),
      //     icon: Icons.home,
      //     type: 0),
      // TransactionTemplate(
      //     title: "Grocery shopping",
      //     description: "Purchased groceries",
      //     amount: "50.000",
      //     date: DateTime.now().add(const Duration(days: -2)),
      //     icon: Icons.shopping_cart,
      //     type: 0),
      // TransactionTemplate(
      //     title: "Salary",
      //     description: "Monthly salary",
      //     amount: "3.000.000",
      //     date: DateTime.now().add(const Duration(days: -2)),
      //     icon: Icons.attach_money,
      //     type: 1),
      // TransactionTemplate(
      //     title: "Restaurant bill",
      //     description: "Dinner at a fancy restaurant",
      //     amount: "182.000",
      //     date: DateTime.now().add(const Duration(days: -2)),
      //     icon: Icons.restaurant,
      //     type: 0),
    ];
  }


  @override
  void onClose() {}
}
