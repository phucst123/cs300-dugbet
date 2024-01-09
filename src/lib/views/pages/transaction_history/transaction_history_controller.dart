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

  @override
  void onInit() {
    super.onInit();
    user = Get.find<AuthController>().getUser();
    getTransactionsData();
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

  Future<void> getTransactionsData() async {
    isLoading.value = true;
    String? user_id = user!.email;
    print("In getTransactionsData() of TransactionHistoryController");
    print(user_id);
    usersRef.doc(user_id).collection('Transactions').get().then(
      (QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach(
            (doc) {
              print("Adding document: " + doc['category']);
              print("Adding document: " + doc['title']);
              print("Adding document: " + doc['description']);
              print("Adding document: " + doc['amount'].toString());
              print("Adding document: " + doc['date'].toString());
              print("Adding document: " + doc['isIncome'].toString());
              transactionsList.add(
                TransactionTemplate(
                  category: doc['category'],
                  title: doc['title'],
                  description: doc['description'],
                  amount: doc['amount'],
                  date: doc['date'].toDate(),
                  icon: 'vegetables.svg',
                  type: doc['isIncome'] == true ? 1 : 0,
                )
              );
            }
          );
        }
        isLoading.value = false;
      }
    );
    print("Finish getTransactionsData() of TransactionHistoryController");
  }
}
