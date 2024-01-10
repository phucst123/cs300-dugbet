import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/controllers/wrapper/wrapper_controller.dart';
import 'package:dugbet/views/pages/home/home_page.dart';
import 'package:dugbet/views/pages/setttings/setting_page.dart';
// import 'package:dugbet/views/pages/transaction/transaction_page.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_page.dart';
import 'package:dugbet/views/pages/wallet/wallet_page.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';

class MainWrapper extends GetView<WrapperController> {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            const HomePage(),
            SettingPage(),
            const TransactionHistoryPage(),
            const WalletPage(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
          onChanged: (BottomBarEnum type) =>
              controller.onTabClick(getCurrentRoute(type))),
      floatingActionButton: ScanButton(
          height: 60,
          width: 57,
          onTap: navigateToTransactionPage,
          // color of the floating button

          child: CustomImageView(
              imagePath: ImageConstant.floatScan,
              height: 50.0.v,
              width: 22.5.h)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // add color 0xFF15A69D to the floating action button
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  int getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return 0;
      case BottomBarEnum.Settings:
        return 1;
      case BottomBarEnum.Stat:
        return 2;
      case BottomBarEnum.Wallet:
        return 3;
      default:
        return 0;
    }
  }
}
