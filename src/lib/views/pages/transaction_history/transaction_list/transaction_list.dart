import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_item.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  TransactionList({super.key, required this.transaction_list});
  List<TransactionTemplate> transaction_list;

  @override
  Widget build(BuildContext context) {
    List<List<TransactionTemplate>> groupedTransactions = groupTransactions();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var transaction in groupedTransactions)...[
          TransactionItem(transaction_list: transaction),
          const SizedBox(height: 20.0)
        ]
      ]
    );
    // return ListView.builder(
    //   itemCount: groupedTransactions.length,
    //   shrinkWrap: true,
    //   itemBuilder: (BuildContext context, int index) {
    //     return TransactionItem(
    //       transaction_list: groupedTransactions[index]
    //     );
    //   },
    // );
  }

  List<List<TransactionTemplate>> groupTransactions() {
    transaction_list.sort((a, b) => a.date.compareTo(b.date));
    List<List<TransactionTemplate>> groupedTransactions = [];
    List<TransactionTemplate> temp = [];
    int currentDay = transaction_list[0].date.day;
    
    for (var transaction in transaction_list) {
      if (transaction.date.day == currentDay) {
        temp.add(transaction);
      } else {
        groupedTransactions.add(temp);
        temp = [];
        temp.add(transaction);
        currentDay = transaction.date.day;
      }
    }
    if (temp.isNotEmpty) {
      groupedTransactions.add(temp);
    }
    return groupedTransactions;
  }

}