import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class GroupBalance extends StatelessWidget {
  const GroupBalance({super.key});

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
                    "assets/images/group_balance.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Positioned(
                  top: MediaQuery.of(context).size.width/32,
                  child: Text("234.000 đ",
                      style: TextThemeBuilder.robotoTextTheme.displaySmall)),
              Positioned(
                  top: MediaQuery.of(context).size.width/8,
                  child: Text("Total Balance",
                      style: TextThemeBuilder.robotoTextTheme.headlineLarge)),
              Positioned(
                  top: MediaQuery.of(context).size.width/3.5,
                  left: MediaQuery.of(context).size.width/16,
                  child: Text("45.000 đ",
                      style: TextThemeBuilder.robotoTextTheme.titleMedium)),
              Positioned(
                  top: MediaQuery.of(context).size.width/3,
                  left: MediaQuery.of(context).size.width/16,
                  child: Text("Income",
                      style: TextThemeBuilder.robotoTextTheme.headlineLarge)),
              Positioned(
                  top: MediaQuery.of(context).size.width/3.5,
                  left: MediaQuery.of(context).size.width/1.5,
                  child: Text("45.000 đ",
                      style: TextThemeBuilder.robotoTextTheme.titleMedium)),
              Positioned(
                  top: MediaQuery.of(context).size.width/3,
                  left: MediaQuery.of(context).size.width/1.5,
                  child: Text("Expense",
                      style: TextThemeBuilder.robotoTextTheme.headlineLarge)),
            ],
          ),
        ),
    );
  }
}