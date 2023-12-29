import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';
import 'package:dugbet/views/widgets/icon_display_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../consts/color/colors.dart';
import 'ListTitleWallet.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorPalette.white.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(color: ColorPalette.white, width: 1)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 15),
            const Row(
              children: [
                SizedBox(width: 15),
                Text("Total Balance"),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.remove_red_eye_outlined)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorPalette.white, width: 2),
                      gradient: const LinearGradient(colors: [
                        ColorPalette.primaryColor,
                        ColorPalette.tertiaryColor
                      ])),
                  child: const Icon(
                    Icons.attach_money,
                    color: ColorPalette.white,
                  ),
                ),
                Text(
                  "234.000 ",
                  style: TextThemeBuilder.robotoTextTheme.titleLarge,
                ),
                SvgPicture.asset("assets/images/dIcon.svg")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                const Text("Your wallet:"),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () => Get.toNamed(AppPage.walletPage,arguments: BottomBarEnum.Wallet),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Row(
                        children: [
                          const SizedBox(width: 15),
                          Container(
                            width: 314,
                            height: 200,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: ColorPalette.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: ColorPalette.black, width: 1)),
                            child: const Center(
                              child: ListTitleWallet(pathImage: "assets/images/defaultPlush.png",moneyValue: "200.000", nameWallet: "Momo"),
                            ),
                          ),
                        ],
                      )),
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
