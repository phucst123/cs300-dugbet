import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionHistoryController extends GetxController {
  late User? user;
  List<TransactionTemplate> transactionsList = [];
  var isLoading = true.obs;
  RxString selectMode = "week".obs;
  StreamSubscription? _transactionSubscription;

  @override
  void onInit() {
    super.onInit();
    user = Get.find<AuthController>().getUser();
    getTransactionsData();
  }

  @override
  void onClose() {
    // dispose of the listener set in onInit
    _transactionSubscription?.cancel();
    super.onClose();
    
  }

  void loadingData() {
    isLoading.value = true;
  }

  void onModeClick(String newMode) {
    selectMode(newMode);
    update();
  }

  Future<void> getTransactionsData() async {
    String? user_id = user!.email;
    //print("In getTransactionsData() of TransactionHistoryController");
    //print(user_id);
    isLoading.value = true;
    print("In getTransactionsData(): ${user_id}");
    transactionsList = [];

    usersRef.doc(user_id).collection('Transactions').get().then(
      (QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          print("In getTransactionsData(): ${querySnapshot.docs.length}");
          querySnapshot.docs.forEach(
            (doc) {
              transactionsList.add(
                TransactionTemplate(
                  category: doc['category'],
                  title: doc['title'],
                  description: doc['description'],
                  amount: doc['amount'],
                  date: doc['date'].toDate(),
                  icon: doc['subCategory'],
                  type: doc['isIncome'] == true ? 1 : 0,
                )
              );
            }
          );
        }
        isLoading.value = false;
      }
    );
      //update();

    // usersRef.doc(user_id).collection('Transactions').get().then(
    //   (QuerySnapshot querySnapshot) {
    //     if (querySnapshot.docs.isNotEmpty) {
    //       querySnapshot.docs.forEach(
    //         (doc) {
    //           transactionsList.add(
    //             TransactionTemplate(
    //               category: doc['category'],
    //               title: doc['title'],
    //               description: doc['description'],
    //               amount: doc['amount'],
    //               date: doc['date'].toDate(),
    //               icon: 'vegetables.svg',
    //               type: doc['isIncome'] == true ? 1 : 0,
    //             )
    //           );
    //         }
    //       );
    //     }
    //     isLoading.value = false;
    //   }
    // );
  }

  int calculateIncome() {
    int income = 0;
    for (var transaction in transactionsList) {
      if (transaction.type == 1) {
        income += transaction.amount;
      }
    }
    return income;
  }

  int calculateExpense() {
    int expense = 0;
    for (var transaction in transactionsList) {
      if (transaction.type == 0) {
        expense += transaction.amount;
      }
    }
    return expense;
  }

  List<TransactionTemplate> filterTransactionsByDate(DateTime startDate, DateTime endDate) {
    return transactionsList
      .where((transaction) =>
        transaction.date.isAfter(startDate.subtract(Duration(days: 1))) &&
        transaction.date.isBefore(endDate.add(Duration(days: 1))))
      .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

    return transactionsList
        .where((transaction) =>
            transaction.date.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
            transaction.date.isBefore(endOfWeek.add(Duration(days: 1))))
        .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentMonth() {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);

    return transactionsList
      .where((transaction) =>
        transaction.date.isAfter(startOfMonth.subtract(Duration(days: 1))) &&
        transaction.date.isBefore(endOfMonth.add(Duration(days: 1))))
      .toList();
  }

  List<TransactionTemplate> filterTransactionsByCurrentYear() {
    DateTime now = DateTime.now();
    DateTime startOfYear = DateTime(now.year, 1, 1);
    DateTime endOfYear = DateTime(now.year + 1, 1, 0);

    return transactionsList
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

    return transactionsList
      .where((transaction) =>
        transaction.date.isAfter(startOfQuarter.subtract(Duration(days: 1))) &&
        transaction.date.isBefore(endOfQuarter.add(Duration(days: 1))))
      .toList();
  }

}
  



