import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:dugbet/models/TransactionModel.dart';
import 'package:dugbet/consts/utils/function_utils.dart';

class HomeController extends GetxController {
  Rxn<User?> user = Rxn();
  RxInt income = 2500000.obs;
  RxInt expense = 480000.obs;
  RxString selectMode = "month".obs;
  List<TransactionTemplate> transactionlist = [];
  RxList<WalletModel> walletData = <WalletModel>[].obs;
  RxInt balance = 0.obs;
  var transactionListModel = <TransactionModel>[];
  @override
  void onInit() {
    // getWallets();
    user.value = Get.find<AuthController>().getUser();
    super.onInit();
    //transactionlist = getTransactionList();
    // getTransactions();
  }

  Future<void> getWallets() async {
    try {
      QuerySnapshot wallets = await FirebaseFirestore.instance
          .collection('Users')
          .doc('vinh123@gmail.com')
          .collection('Wallets')
          .get();
      walletData.clear();
      balance.value = 0;
      for (var wallet in wallets.docs) {
        print("im here to read ${wallet.data()}");
        walletData
            .add(WalletModel.fromDocumentSnapshot(documentSnapshot: wallet));
        balance.value +=
            double.parse(wallet['initialAmount'].toString()).toInt();
      }
      // update();
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting wallet list',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> getTransactions() async {
    try {
      QuerySnapshot transactions = await FirebaseFirestore.instance
          .collection('Users')
          .doc('vinh123@gmail.com')
          .collection('Transactions')
          .get();
      transactionListModel.clear();
      transactionlist.clear();
      income.value = 0;
      expense.value = 0;
      transactionlist.add(TransactionTemplate(
          category: "Fnb",
          title: "Snack",
          description: "Income from design project",
          amount: 85,
          date: DateTime.now(),
          icon: "snack.svg",
          type: 1));
      income.value += 85000;
      transactionlist.add(TransactionTemplate(
          category: "Clothing",
          title: "Rent payment",
          description: "Monthly rent payment",
          amount: 123,
          date: DateTime.now(),
          icon: "socks.svg",
          type: 0));
      expense.value += 123000;
      for (var transaction in transactions.docs) {
        print("im here to read ${transaction.data()}");
        transactionListModel.add(TransactionModel.fromDocumentSnapshot(
            documentSnapshot: transaction));
        transactionlist.add(TransactionTemplate(
          category: transaction['category'],
          title: transaction['title'],
          description: transaction['description'],
          // from Minh: Vinh hay Binh code cho nay thi fix lai gium tui nhe. Tui tam thoi comment de tranh error
          //amount: convertToCurrency(transaction['amount']),
          amount: 100,
          // convert to DateTime from Timestamp
          date: DateTime.now(),

          ///transaction['date'].toDate(),
          icon: 'snack.svg',
          type: transaction['isIncome'] ? 1 : 0,
        ));
        // convert to int amount from number to int
        if (transaction['isIncome']) {
          income.value +=
              double.parse(transaction['amount'].toString()).toInt();
        } else {
          expense.value +=
              double.parse(transaction['amount'].toString()).toInt();
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting transaction list',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  List<TransactionTemplate> getTransactionList() {
    return [
      TransactionTemplate(
          category: "Fnb",
          title: "Snack",
          description: "Income from design project",
          amount: 5,
          date: DateTime.now(),
          icon: "snack.svg",
          type: 1),
      TransactionTemplate(
          category: "Clothing",
          title: "Rent payment",
          description: "Monthly rent payment",
          amount: 1000000,
          date: DateTime.now(),
          icon: "socks.svg",
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
