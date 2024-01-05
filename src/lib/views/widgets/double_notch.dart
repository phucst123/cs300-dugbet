import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class DoubleNotch extends StatelessWidget {
  DoubleNotch({super.key});

  final controller = Get.put<TransactionController>(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -20,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.incomeText),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text("Expense"),
                  ),
                )),
            Positioned(
                top: 119,
                child: Container(
                    height: MediaQuery.of(context).size.width / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorPalette.black)),
                    child: const Center(
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30),
                      ),
                    ))),
            Positioned(
                top: 285,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.incomeText,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(" Edit "),
                  ),
                )),
            Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/top_notch.svg",
                      width: MediaQuery.of(context).size.width,
                      height: 150,
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
                      height: 150,
                    ),
                    Positioned(
                        top: 35,
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
            Padding(
              padding: EdgeInsets.only(
                  top: 55, left: MediaQuery.of(context).size.width / 2),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "0",
                        border: InputBorder.none,
                        hintStyle: TextThemeBuilder.robotoTextTheme.titleLarge,
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
                    padding: const EdgeInsets.only(bottom: 20,right: 20),
                    child: SvgPicture.asset("assets/images/dIcon.svg"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 190, left: MediaQuery.of(context).size.width / 2,right: 20),
              child: TextField(
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
          ],
        ),
      ),
    );
  }
}
