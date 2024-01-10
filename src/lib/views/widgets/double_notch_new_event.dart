import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/wallet/wallet_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/widgets/pick_bank_icon.dart';
import 'package:dugbet/views/widgets/search_category_custom.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/color/theme.dart';
import '../../consts/fonts/text_theme_builder.dart';

class DoubleNotchNewEvent extends StatelessWidget {
  const DoubleNotchNewEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller;
    if (Get.isRegistered<WalletController>()) {
      controller = Get.find<WalletController>();
    } else {
      controller = Get.put<WalletController>(WalletController());
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Obx(() => Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/top_notch.svg",
                      width: MediaQuery.of(context).size.width,
                      // height: 150,
                    ),
                    Positioned(
                        top: 35,
                        right: 20,
                        child: Text(
                          "Amount",
                          style: TextThemeBuilder
                              .robotoTextTheme.headlineLarge,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/bot_notch.svg",
                      width: MediaQuery.of(context).size.width,
                      // height: 150,
                    ),
                    Positioned(
                        top: 33,
                        right: 20,
                        child: Text(
                          "Description",
                          style: TextThemeBuilder
                              .robotoTextTheme.headlineLarge,
                        )),
                  ],
                )
              ],
            ),
            Positioned(
                top: -10,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.incomeText),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                        "Personal",
                        style: const TextStyle(color: ColorPalette.white)),
                  ),
                )),
            Positioned(
                top: 155,
                child: InkWell(
                  onTap: () {
                    Get.dialog(PickBankIcon());
                  },
                  child: Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorPalette.black)),
                      child: Center(
                        child: Image.asset(
                            "assets/Bank/${controller.bankIcon.value.toLowerCase()}.png"),
                      )),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: 55,
                  left: MediaQuery.of(context).size.width / 2,
                  right: MediaQuery.of(context).size.width - 360),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "0",
                        border: InputBorder.none,
                        hintStyle:
                        TextThemeBuilder.robotoTextTheme.titleLarge,
                      ),
                      controller: controller.incomeTextEdit,
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      style: TextThemeBuilder.robotoTextTheme.titleLarge,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\n')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: SvgPicture.asset("assets/images/dIcon.svg"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 186,
                  left: MediaQuery.of(context).size.width / 2,
                  right: MediaQuery.of(context).size.width - 360),
              child: TextField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "...",
                  border: InputBorder.none,
                  hintStyle: TextThemeBuilder.robotoTextTheme.titleLarge,
                ),
                controller: controller.descriptionTextEdit,
                style: TextThemeBuilder.robotoTextTheme.headlineLarge,
                maxLines: 4,
                maxLength: 63,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\n')),
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              // child: ElevatedButton(
              //   onPressed: () {
              //     Get.toNamed(AppPage.scanPage);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: ColorPalette.incomeText,
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 10, vertical: 5),
              //     child: Text(
              //       controller.isEdit.value ? " Edit " : " Scan ",
              //       style: const TextStyle(color: ColorPalette.white),
              //     ),
              //   ),
              // ),
              child: InkWell(
                onTap: () {},
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
                      "Reset",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: ColorPalette.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
