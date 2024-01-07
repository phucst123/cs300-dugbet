import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/dialogs/logout_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  bool isPremium = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: isPremium ? ColorPalette.expenseText : ColorPalette.white,
            height: 260,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isPremium) SvgPicture.asset("assets/icons/crown.svg"),
                const SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorPalette.black,
                          width: 1.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: ColorPalette.white,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: SvgPicture.asset("assets/user/user.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Anomyous",
                  style: context.textTheme.titleLarge,
                ),
                Text(
                  "youremail@email.com",
                  style: context.textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                leading: SvgPicture.asset("assets/icons/profile.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Edit Profile",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.editProfilePage),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/notification.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Notifications",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.editNotificationPage),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/appearance.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Appearance",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/security.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Security",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.securityPage),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/policy.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Privacy Policy",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/help.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Contact Us",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/crown.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Premium",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.purchasePage),
              ),
            ],
          )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // child: NormalButton(
              //     title: "Logout",
              //     callback: () => {
              //           showDialog(
              //             context: context,
              //             builder: (_) => LogoutDialog(),
              //           )
              //         }),
              child: StringButton(
                text: "Logout",
                callback: () => {
                  showDialog(
                    context: context,
                    builder: (_) => LogoutDialog(),
                  )
                },
                buttonTextStyle: CustomTextStyles.titleMediumBluegray900,
                buttonStyle: CustomButtonStyles.fillTear,
              )),
          const SizedBox(
            height: 98,
          ),
        ],
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
