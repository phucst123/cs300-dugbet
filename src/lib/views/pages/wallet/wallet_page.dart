import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/wallet_list.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration:
            const BoxDecoration(gradient: ColorPalette.secondaryGradient),
        child: Stack(
          children: [
            Positioned(
              left: 15,
              top: 15,
              child: Text(
                "Wallets",
                style: TextThemeBuilder.robotoTextTheme.titleLarge,
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: WalletList(),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: (){},
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
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButton: ScanButton(
          height: 60,
          width: 57,
          onTap: () {},
          // color of the floating button

          child: CustomImageView(
              imagePath: ImageConstant.floatScan,
              height: 30.0.v,
              width: 28.5.h)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // add color 0xFF15A69D to the floating action button
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
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
}
