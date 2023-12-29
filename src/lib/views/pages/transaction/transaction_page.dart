import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/theme.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';
import 'package:dugbet/views/widgets/double_notch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';


class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DoubleNotch(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time",
                          style: TextThemeBuilder.robotoTextTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("20:30",
                                style:
                                    TextThemeBuilder.robotoTextTheme.titleMedium),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("09:Oct:2023",
                                style: TextThemeBuilder.robotoTextTheme.titleMedium)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wallet",
                              style: TextThemeBuilder.robotoTextTheme.headlineLarge,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Momo",
                              style: TextThemeBuilder.robotoTextTheme.titleMedium,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ClipOval(
                            child: Center(
                              child: SvgPicture.asset("assets/images/momo.svg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text("Show more details",style: TextThemeBuilder.robotoTextTheme.labelLarge,),
                        const Spacer(),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StringButton(
                        text: "Cancel".tr,
                        callback: onTapCancel,
                        buttonStyle: CustomButtonStyles.none,
                        decoration:
                            CustomButtonStyles.gradientTealToTealDecoration,
                        width: 140.h,
                      ),
                    StringButton(
                        text: "Save".tr,
                        callback: onTapSave,
                        buttonStyle: CustomButtonStyles.none,
                        decoration:
                            CustomButtonStyles.gradientTealToTealDecoration,
                        width: 140.h,
                      ),
                    // Container(
                    //   height: 44,
                    //   width: 140,
                    //   decoration: BoxDecoration(
                    //       color: LightTheme.primaryColor,
                    //       borderRadius: BorderRadius.circular(25)
                    //   ),
      
                    //   child: Center(child: Text("Save",style: TextThemeBuilder.robotoTextTheme.headlineLarge,)),
                    // )
                  ],
                )
              ],
            ),
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            // add color 0xFF15A69D to the floating action button
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
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

  onTapCancel() => Get.back();

  onTapSave() => Get.back();
}
