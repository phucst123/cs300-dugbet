import 'package:card_swiper/card_swiper.dart';
import 'package:dugbet/views/widgets/group_balance.dart';
import 'package:dugbet/views/widgets/group_balance_one.dart';
import 'package:dugbet/views/widgets/header_bar.dart';
import 'package:dugbet/views/widgets/stat.dart';
import 'package:dugbet/views/widgets/stat_one.dart';
import 'package:dugbet/views/widgets/wallet.dart';
import 'package:dugbet/views/widgets/button/scan_button.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  String selectMode = "month";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration:
            const BoxDecoration(gradient: ColorPalette.secondaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButton<String>(
                    value: selectMode,
                    underline: Container(
                      color: Colors.grey,
                      width: 1,
                    ),
                    dropdownColor: ColorPalette.white.withOpacity(0.9),
                    items: const [
                      DropdownMenuItem(
                          value: "today", child: Text("Today")),
                      DropdownMenuItem(
                          value: "week", child: Text("This week")),
                      DropdownMenuItem(
                          value: "month", child: Text("This month")),
                      DropdownMenuItem(
                          value: "quarter", child: Text("This quarter")),
                      DropdownMenuItem(
                          value: "year", child: Text("This year"))
                    ],
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    onChanged: (String? value) {
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Swiper(
                viewportFraction: 0.9,
                scale: 0.75,
                itemCount: 5,
                duration: 1000,
                loop: true,
                itemHeight: 250,
                itemWidth: 270,
                layout: SwiperLayout.TINDER,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(78, 12, 78, 12),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 44,
                  width: 130,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        ColorPalette.primaryColor,
                        ColorPalette.tertiaryColor
                      ]),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                      child: Text(
                    "Analyze",
                    style: TextStyle(color: ColorPalette.white),
                  )),
                ),
              ),
            ),
            const Expanded(child: Wallet())
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
}
