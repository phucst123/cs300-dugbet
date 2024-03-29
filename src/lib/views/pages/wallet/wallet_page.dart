import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/controllers/wallet/wallet_personal_controller.dart';
import 'package:dugbet/views/widgets/home_header_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../../controllers/wallet/wallet_controller.dart';
import '../../widgets/wallet_list.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key, this.showNav = false});

  final bool showNav;

  @override
  Widget build(BuildContext context) {
    WalletController controller;
    if (Get.isRegistered<WalletController>()) {
      controller = Get.find<WalletController>();
    } else {
      controller = Get.put<WalletController>(WalletController());
    }
    List<Widget> pageWidgets = [
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 20.0, left: 16.0),
        child: Text(
          "Wallets",
          style: TextThemeBuilder.robotoTextTheme.titleLarge,
        ),
      ),
      WalletList(),
    ];
    if (showNav == false) {
      return SafeArea(
        child: Scaffold(
          appBar: HomeHeaderBar(
            leftWidget: SvgPicture.asset(
              "assets/icons/nav_wallet.svg",
              colorFilter:
                  const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: ColorPalette.tearButton),
                child: ListView.builder(
                    itemCount: pageWidgets.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return pageWidgets[index];
                    }),
              ),
              Positioned(
                right: 20,
                bottom: 50,
                child: InkWell(
                  onTap: () {
                    if (controller.isWallet.value) {
                      Get.toNamed(AppPage.walletNewWallet);
                    } else {
                      Get.toNamed(AppPage.eventTransaction);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Colors.orangeAccent, shape: BoxShape.circle),
                    child: const Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: HomeHeaderBar(
            leftWidget: SvgPicture.asset(
              "assets/icons/nav_wallet.svg",
              colorFilter:
                  const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: ColorPalette.tearButton),
                child: ListView.builder(
                    itemCount: pageWidgets.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return pageWidgets[index];
                    }),
              ),
              Positioned(
                right: 20,
                bottom: 50,
                child: InkWell(
                  onTap: () {
                    if (controller.isWallet.value) {
                      Get.toNamed(AppPage.walletNewWallet);
                    } else {
                      Get.toNamed(AppPage.eventTransaction);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Colors.orangeAccent, shape: BoxShape.circle),
                    child: const Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: _buildBottomAppBar(),
          floatingActionButton: ScanButton(
              height: 60,
              width: 57,
              onTap: navigateToTransactionPage,
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
