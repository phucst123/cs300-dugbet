import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  Rxn<User?> user = Rxn();
  RxInt income = 2500000.obs;
  RxInt expense = 480000.obs;
  RxString selectMode = "month".obs;
  List<TransactionTemplate> transactionlist = [];
  List<WalletModel> wallet = [];
  @override
  void onInit() {
    super.onInit();
    user.value = Get.find<AuthController>().getUser();
    transactionlist = getTransactionList();
    wallet = getWalletList();
  }

  List<WalletModel> getWalletList() {
    return [
      // WalletModel(id: '01', walletPicture: walletPicture, description: description, initialAmount: initialAmount, expense: expense, income: income, name: name, type: type, transactions: transactions)
    ];
  }

  List<TransactionTemplate> getTransactionList() {
    return [
      TransactionTemplate(
          title: "Design income",
          description: "Income from design project",
          amount: "5.000",
          date: DateTime.now(),
          icon: Icons.design_services,
          type: 1),
      TransactionTemplate(
          title: "Rent payment",
          description: "Monthly rent payment",
          amount: "1.000.000",
          date: DateTime.now(),
          icon: Icons.home,
          type: 0),
      TransactionTemplate(
          title: "Grocery shopping",
          description: "Purchased groceries",
          amount: "50.000",
          date: DateTime.now(),
          icon: Icons.shopping_cart,
          type: 0),
      TransactionTemplate(
          title: "Salary",
          description: "Monthly salary",
          amount: "3.000.000",
          date: DateTime.now(),
          icon: Icons.attach_money,
          type: 1),
      TransactionTemplate(
          title: "Restaurant bill",
          description: "Dinner at a fancy restaurant",
          amount: "200.000",
          date: DateTime.now(),
          icon: Icons.restaurant,
          type: 0),
      TransactionTemplate(
          title: "Design income",
          description: "Income from design project",
          amount: "500.000",
          date: DateTime.now().add(const Duration(days: -1)),
          icon: Icons.design_services,
          type: 1),
      TransactionTemplate(
          title: "Rent payment",
          description: "Monthly rent payment",
          amount: "1.000.000",
          date: DateTime.now().add(const Duration(days: -1)),
          icon: Icons.home,
          type: 0),
      TransactionTemplate(
          title: "Grocery shopping",
          description: "Purchased groceries",
          amount: "50.000",
          date: DateTime.now().add(const Duration(days: -1)),
          icon: Icons.shopping_cart,
          type: 0),
      TransactionTemplate(
          title: "Salary",
          description: "Monthly salary",
          amount: "3.000.000",
          date: DateTime.now().add(const Duration(days: -1)),
          icon: Icons.attach_money,
          type: 1),
      TransactionTemplate(
          title: "Restaurant bill",
          description: "Dinner at a fancy restaurant",
          amount: "200.000",
          date: DateTime.now().add(const Duration(days: -1)),
          icon: Icons.restaurant,
          type: 0),
      TransactionTemplate(
          title: "Design income",
          description: "Income from design project",
          amount: "500.000",
          date: DateTime.now().add(const Duration(days: -2)),
          icon: Icons.design_services,
          type: 1),
      TransactionTemplate(
          title: "Rent payment",
          description: "Monthly rent payment",
          amount: "1.000.000",
          date: DateTime.now().add(const Duration(days: -2)),
          icon: Icons.home,
          type: 0),
      TransactionTemplate(
          title: "Grocery shopping",
          description: "Purchased groceries",
          amount: "50.000",
          date: DateTime.now().add(const Duration(days: -2)),
          icon: Icons.shopping_cart,
          type: 0),
      TransactionTemplate(
          title: "Salary",
          description: "Monthly salary",
          amount: "3.000.000",
          date: DateTime.now().add(const Duration(days: -2)),
          icon: Icons.attach_money,
          type: 1),
      TransactionTemplate(
          title: "Restaurant bill",
          description: "Dinner at a fancy restaurant",
          amount: "182.000",
          date: DateTime.now().add(const Duration(days: -2)),
          icon: Icons.restaurant,
          type: 0),
    ];
  }

  void onModeClick(String newMode) {
    selectMode(newMode);
    if (newMode == "today") {
      income.value = 0;
      expense.value = 30000;
    } else if (newMode == "week") {
      income.value = 100000;
      expense.value = 320000;
    } else if (newMode == "month") {
      income.value = 2500000;
      expense.value = 480000;
    } else if (newMode == "quarter") {
      income.value = 5000000;
      expense.value = 750000;
    } else if (newMode == "year") {
      income.value = 100000000;
      expense.value = 2345000;
    }
    update();
  }

  @override
  void onClose() {}
}
