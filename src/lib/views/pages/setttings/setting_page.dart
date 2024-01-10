import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/controllers/setting/setting_controller.dart';
import 'package:dugbet/views/dialogs/logout_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SettingPage extends GetView<SettingController> {
  SettingPage({super.key, this.showNav = false});

  final bool showNav;

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading.value) {
      return Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset("assets/lottie/loading.json", fit: BoxFit.cover),
        ),
      );
    } else {
      if (showNav) {
        return Scaffold(
          // appBar: HeaderBar(
          //   leftWidget: SvgPicture.asset(
          //     "assets/nav_stat.svg",
          //     colorFilter:
          //         const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
          //   ),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: controller.isPremium.value
                    ? ColorPalette.expenseText
                    : ColorPalette.primaryColor.withOpacity(0.1),
                height: 260,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (controller.isPremium.value)
                      SvgPicture.asset("assets/icons/crown.svg"),
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
                    Obx(() => Text(
                          controller.name.value,
                          style: context.textTheme.titleLarge,
                        )),
                    Obx(() => Text(
                          controller.email.value,
                          style: context.textTheme.labelLarge,
                        )),
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
                        builder: (_) => const LogoutDialog(),
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
        );
      } else {
        return Scaffold(
          // appBar: HeaderBar(
          //   leftWidget: SvgPicture.asset(
          //     "assets/icons/nav_stat.svg",
          //     colorFilter:
          //         const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
          //   ),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: controller.isPremium.value
                    ? ColorPalette.expenseText
                    : ColorPalette.primaryColor.withOpacity(0.1),
                height: 260,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (controller.isPremium.value)
                      SvgPicture.asset("assets/icons/crown.svg"),
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
                    Obx(() => Text(
                          controller.name.value,
                          style: context.textTheme.titleLarge,
                        )),
                    Obx(() => Text(
                          controller.email.value,
                          style: context.textTheme.labelLarge,
                        )),
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
                        builder: (_) => const LogoutDialog(),
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
        );
      }
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
