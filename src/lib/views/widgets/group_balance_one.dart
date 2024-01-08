import 'package:dugbet/consts/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class GroupBalanceOne extends StatelessWidget {
  const GroupBalanceOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: MediaQuery.of(context).size.width / 2 - 50,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(AppPage.walletDetail),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.incomeText,
                    ),
                    child: const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text("Details",style: TextStyle(color: ColorPalette.white),),
                    ),
                  )),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/group_balance1.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Positioned(
                  top: MediaQuery.of(context).size.width/7,
                  left: MediaQuery.of(context).size.width/16,
                  child: Text("234.000 đ",
                      style: TextThemeBuilder.robotoTextTheme.displaySmall)),
              Positioned(
                  top: MediaQuery.of(context).size.width/4,
                  left: MediaQuery.of(context).size.width/16,
                  child: Text("Total Expense",
                      style: TextThemeBuilder.robotoTextTheme.labelLarge)),
            ],
          ),
        ),
    );
  }
}
