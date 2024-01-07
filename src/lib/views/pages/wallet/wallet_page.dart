import 'package:dugbet/views/widgets/home_header_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/wallet_list.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key, this.showNav = false});
  final bool showNav;
  @override
  Widget build(BuildContext context) {
    List<Widget> pageWidgets = [
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 20.0, left: 16.0),
        child: Text(
          "Wallets",
          style: TextThemeBuilder.robotoTextTheme.titleLarge,
        ),
      ),
      const WalletList(),
      InkWell(
        onTap: () {},
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
      )
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
          body: Container(
            decoration: const BoxDecoration(color: ColorPalette.tearButton),
            child: ListView.builder(
                itemCount: pageWidgets.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return pageWidgets[index];
                }),
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
          body: Container(
            decoration: const BoxDecoration(color: ColorPalette.tearButton),
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
              onTap: () {},
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
