import 'package:dugbet/views/pages/transaction_history/balance_status.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_chart.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  //const TransactionHistoryPage({required Key key}) : super(key: key);
  const TransactionHistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Widget> page_widgets = [
      TransactionChart(
        title: 'Statistics',
        incomeData: [2, 1, 3, 1, 0, 4, 5],
        expenseData: [3, 5, 1, 4, 3, 0, 4],
      ),
      BalanceStatus()
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Container(
        color: const Color(0xFFB6DDD5),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return page_widgets[index];
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}