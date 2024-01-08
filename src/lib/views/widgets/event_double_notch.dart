import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/pages/category/choose_category_page.dart';
import 'package:dugbet/views/pages/transaction/event_transaction_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/widgets/search_category_custom.dart';
import 'package:dugbet/views/widgets/stat.dart';
import 'package:dugbet/views/widgets/stat_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../consts/color/colors.dart';
import '../../consts/color/theme.dart';
import '../../consts/fonts/text_theme_builder.dart';

class EventDoubleNotch extends StatelessWidget {
  EventDoubleNotch({super.key});

  final controller = Get.find<EventTransactionController>();

  @override
  Widget build(BuildContext context) {
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
                top: -20,
                child: ElevatedButton(
                  onPressed: () {
                    Get.dialog(SafeArea(
                      minimum: const EdgeInsets.all(40),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  controller.isIncome.value = true;
                                  Get.back();
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      border: Border.all(
                                          color: ColorPalette.black),
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color:
                                                LightTheme.primaryColor,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    12)),
                                            child: const Icon(
                                                Icons.arrow_upward_outlined,
                                                color: Colors.white)),
                                        Text("Income",
                                            style: TextThemeBuilder
                                                .robotoTextTheme
                                                .headlineLarge)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  controller.isIncome.value = false;
                                  Get.back();
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.7),
                                      border: Border.all(
                                          color: ColorPalette.black),
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color:
                                                LightTheme.primaryColor,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    12)),
                                            child: Icon(
                                                Icons
                                                    .arrow_downward_outlined,
                                                color: Colors.white)),
                                        Text("Expense",
                                            style: TextThemeBuilder
                                                .robotoTextTheme
                                                .headlineLarge)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.incomeText),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                        controller.isIncome.value ? 'Income' : 'Expense',
                        style: TextStyle(color: ColorPalette.white)),
                  ),
                )),
            Positioned(
                top: 119,
                child: InkWell(
                  onTap: () {
                    Get.dialog(SearchCategoryCustom());
                  },
                  child: Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorPalette.black)),
                      child: Center(
                        child: SvgPicture.asset("assets/icons/category/${controller.title.value.toLowerCase()}/${controller.icon.value.toLowerCase()}"),
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
                  right: MediaQuery.of(context).size.width - 360+20),
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
                top: 280,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppPage.scanPage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.incomeText,
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      controller.isEdit.value ? " Edit " : " Scan ",
                      style: TextStyle(color: ColorPalette.white),
                    ),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
