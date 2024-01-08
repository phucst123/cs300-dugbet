import 'package:dugbet/views/widgets/bottom_sheet_transaction.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_overview/balance_status.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_overview/transaction_chart.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';

List<TransactionTemplate> transaction_list = [
  TransactionTemplate(
      category: "Clothing",
      title: "Ear muffs",
      description: "Income from design project",
      amount: "5.000",
      date: DateTime.now(),
      icon: "ear_muffs.svg",
      type: 1),
  TransactionTemplate(
      category: "Fnb",
      title: "Burger",
      description: "Monthly rent payment",
      amount: "1.000.000",
      date: DateTime.now(),
      icon: "burger.svg",
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

class TransactionHistoryPage extends StatelessWidget {
  //const TransactionHistoryPage({required Key key}) : super(key: key);
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pageWidgets = [
      Container(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 30.0, bottom: 0.0),
        child: const Column(
          children: [
            TransactionChart(
              title: 'Statistics',
              incomeData: [2, 1, 3, 1, 0, 4, 5],
              expenseData: [3, 5, 1, 4, 3, 0, 4],
            ),
            SizedBox(height: 18.0),
            BalanceStatus(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      const BottomSheetTransaction()
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Container(
        color: const Color(0xFFB6DDD5),
        child: ListView.builder(
            itemCount: pageWidgets.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return pageWidgets[index];
            }),
      ),
    );
  }
}
