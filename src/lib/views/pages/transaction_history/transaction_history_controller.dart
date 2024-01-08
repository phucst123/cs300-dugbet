import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/firebase_ref/references.dart';

List<String> transactionsList = <String>[
  '100001'
];

class TransactionSummary {
  final String title;
  final String description;
  final String amount;
  final DateTime date;
  final IconData icon;
  final int type;

  TransactionSummary({
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.icon,
    required this.type,
  });
}

class TransactionHistoryController extends GetxController {

  @override
  void onReady() {
    getTransactionsData();
    super.onReady();
  }

  Future<void> getTransactionsData() async {
    for (String transactionId in transactionsList) {
      DocumentSnapshot transactionSnapshot = await transactionsRef.doc(transactionId).get();
      if (transactionSnapshot.exists) {
        Map<String, dynamic>? transactionData = transactionSnapshot.data() as Map<String, dynamic>?;
        String transactionCategory = transactionData!['category'];
        String transactionSubCategory = transactionData['subCategory'];
        String categoryID = '400001';
        DocumentSnapshot categorySnapshot = await categoriesRef.doc(categoryID).collection('categories')
                                              .doc(transactionCategory).collection('subCategories')
                                              .doc(transactionSubCategory).get();
        Map<String, dynamic>? categoryData = categorySnapshot.data() as Map<String, dynamic>?;
        TransactionSummary transactionSummary = TransactionSummary(
          title: transactionData['title'],
          description: transactionData['description'],
          amount: transactionData['amount'],
          date: transactionData['date'].toDate(),
          icon: categoryData!['icon'],
          type: transactionData['type'],
        );
      }
      else {
        print('Transaction with ID $transactionId does not exist in the Transactions collection');
      }
    }
  }
}