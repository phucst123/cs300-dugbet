import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class GroupBalance extends StatelessWidget {
  const GroupBalance({super.key, required this.walletData});

  final WalletModel walletData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppPage.walletDetail, arguments: walletData),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width / 2 - 55,
              // child: ElevatedButton(
              //   onPressed: () => Get.toNamed(AppPage.walletDetail, arguments: walletData),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: ColorPalette.incomeText,
              //   ),
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              //     child: Text(
              //       "Details",
              //       style: TextStyle(color: ColorPalette.white),
              //     ),
              //   ),
              // ),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      ColorPalette.primaryColor,
                      ColorPalette.tertiaryColor
                    ]),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Detail",
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: ColorPalette.white,
                    ),
                  ),
                ),
              ),
            ),
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
                top: MediaQuery.of(context).size.width / 32,
                child: Row(
                  children: [
                    Text(convertToCurrency(walletData.balance),
                        style: TextThemeBuilder.robotoTextTheme.displaySmall),
                    SvgPicture.asset(
                      "assets/images/dIcon.svg",
                      height: 27,
                      color: ColorPalette.defaultText,
                    )
                  ],
                )),
            Positioned(
                top: MediaQuery.of(context).size.width / 8,
                child: Text("Total Balance",
                    style: TextThemeBuilder.robotoTextTheme.headlineLarge)),
            Positioned(
              top: MediaQuery.of(context).size.width / 3.5,
              left: MediaQuery.of(context).size.width / 16,
              child: Row(
                children: [
                  Text(convertToCurrency(walletData.income),
                      style: TextThemeBuilder.robotoTextTheme.titleMedium),
                  SvgPicture.asset(
                    "assets/images/dIcon.svg",
                    height: 15,
                    color: ColorPalette.defaultText,
                  )
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.width / 3,
                left: MediaQuery.of(context).size.width / 16,
                child: Text("Income",
                    style: TextThemeBuilder.robotoTextTheme.headlineLarge)),
            Positioned(
              top: MediaQuery.of(context).size.width / 3.5,
              left: MediaQuery.of(context).size.width / 1.5,
              child: Row(
                children: [
                  Text(convertToCurrency(walletData.expense),
                      style: TextThemeBuilder.robotoTextTheme.titleMedium),
                  SvgPicture.asset(
                    "assets/images/dIcon.svg",
                    height: 15,
                    color: ColorPalette.defaultText,
                  )
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.width / 3,
                left: MediaQuery.of(context).size.width / 1.5,
                child: Text("Expense",
                    style: TextThemeBuilder.robotoTextTheme.headlineLarge)),
          ],
        ),
      ),
    );
  }
}
