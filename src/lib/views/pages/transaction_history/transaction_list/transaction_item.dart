import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_item_list.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_item_summary.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transaction_list});
  final List<TransactionTemplate> transaction_list; // assuming all transactions are of the same date

  @override
  Widget build(BuildContext context) {
    // final List<Widget> page_widgets = [
    //   TransactionItemSummary(
    //     date: transaction_list[0].date,
    //     income: calculateIncome(),
    //     expense: calculateExpense()
    //   ),
    //   TransactionItemList(transaction_list: transaction_list)
    // ];
    return Container(
      //padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: ColorPalette.black, width: 1)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        children: [
          TransactionItemSummary(
            date: transaction_list[0].date,
            income: calculateIncome().toString(),
            expense: calculateExpense().toString()
          ),
          const SizedBox(height: 8.0),
          const Divider(),
          TransactionItemList(transaction_list: transaction_list)
        ],
      )
    );
  }

  int calculateIncome() {
    int incomeSum = 0;

    for (var transaction in transaction_list) {
      if (transaction.type == 1) {
        incomeSum += transaction.amount;
      }
    }

    return incomeSum;
  }

  int calculateExpense() {
    int expenseSum = 0;

    for (var transaction in transaction_list) {
      if (transaction.type == 0) {
        expenseSum += transaction.amount;
      }
    }

    return expenseSum;
  }
}