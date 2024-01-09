import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_controller.dart';
import 'package:dugbet/views/widgets/bottom_sheet_transaction.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_overview/balance_status.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_overview/transaction_chart.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';
import 'package:dugbet/views/widgets/home_header_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

// List<TransactionTemplate> transaction_list = [
//   TransactionTemplate(
//       category: "Clothing",
//       title: "Ear muffs",
//       description: "Income from design project",
//       amount: "5.000",
//       date: DateTime.now(),
//       icon: "ear_muffs.svg",
//       type: 1),
//   TransactionTemplate(
//       category: "Fnb",
//       title: "Burger",
//       description: "Monthly rent payment",
//       amount: "1.000.000",
//       date: DateTime.now(),
//       icon: "burger.svg",
//       type: 0),
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
//];

class TransactionHistoryPage extends StatelessWidget {
  //const TransactionHistoryPage({required Key key}) : super(key: key);
  const TransactionHistoryPage({super.key, this.showNav = false});
  final bool showNav;
  @override
  Widget build(BuildContext context) {
    List<Widget> pageWidgets = [
      Container(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 30.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TransactionChart(),
            const SizedBox(height: 18.0),
            BalanceStatus(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      BottomSheetTransaction(transaction_list: Get.find<TransactionHistoryController>().transactionsList),
    ];
    if (showNav) {
      return SafeArea(
        child: Scaffold(
          appBar: HomeHeaderBar(
            leftWidget: SvgPicture.asset(
              "assets/icons/nav_stat.svg",
              colorFilter:
                  const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
            ),
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
          bottomNavigationBar: _buildBottomAppBar(),
          floatingActionButton: ScanButton(
              height: 60,
              width: 57,
              onTap: () => Get.toNamed(AppPage.transactionPage),
              // color of the floating button

              child: CustomImageView(
                  imagePath: ImageConstant.floatScan,
                  height: 50.0.v,
                  width: 22.5.h)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // add color 0xFF15A69D to the floating action button
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: HomeHeaderBar(
            leftWidget: SvgPicture.asset(
              "assets/icons/nav_stat.svg",
              colorFilter:
                  const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
            ),
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
        ),
      );
    }
  }

  Widget _buildBottomAppBar() {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), arguments: type);
    });
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppPage.homePage;
      case BottomBarEnum.Settings:
        return AppPage.settingPage;
      case BottomBarEnum.Stat:
        return AppPage.transactionHistoryPage;
      case BottomBarEnum.Wallet:
        return AppPage.walletPage;
      default:
        return "/";
    }
  }

  onTapAnalyze() => Get.offAndToNamed(
        AppPage.transactionHistoryPage,
      );
}
