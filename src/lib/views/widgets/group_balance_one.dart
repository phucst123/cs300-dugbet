import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class GroupBalanceOne extends StatelessWidget {
  const GroupBalanceOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: MediaQuery.of(context).size.width / 2 - 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.incomeText,
                    ),
                    child: const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text("Details"),
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
