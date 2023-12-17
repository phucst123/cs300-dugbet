import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_item.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          SizedBox(height: 10.0)
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
    int current_day = transaction_list[0].date.day;
    
    for (var transaction in transaction_list) {
      if (transaction.date.day == current_day) {
        temp.add(transaction);
      } else {
        groupedTransactions.add(temp);
        temp = [];
        temp.add(transaction);
        current_day = transaction.date.day;
      }
    }
    if (temp.isNotEmpty)
      groupedTransactions.add(temp);
    return groupedTransactions;
  }

}