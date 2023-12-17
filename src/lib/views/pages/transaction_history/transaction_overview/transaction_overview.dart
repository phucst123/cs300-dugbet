import 'package:dugbet/views/pages/transaction_history/transaction_overview/balance_status.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_overview/transaction_chart.dart';
import 'package:flutter/material.dart';

class TransactionOverview extends StatelessWidget {
  const TransactionOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TransactionChart(
          title: 'Statistics',
          incomeData: [2, 1, 3, 1, 0, 4, 5],
          expenseData: [3, 5, 1, 4, 3, 0, 4],
        ),
        BalanceStatus()
      ]
    );
  }
}