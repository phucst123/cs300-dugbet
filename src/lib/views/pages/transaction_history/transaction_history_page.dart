import 'package:dugbet/views/pages/transaction_history/balance_status.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_chart.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  //const TransactionHistoryPage({required Key key}) : super(key: key);
  TransactionHistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Container(
        color: const Color(0xFFB6DDD5),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TransactionChart(
                title: 'Statistics',
                incomeData: [2, 1, 3, 1, 0, 4, 5],
                expenseData: [3, 5, 1, 4, 3, 0, 4],
              ),
              BalanceStatus(),
            ],
          ),
        ),
      ),
    );
  }
}