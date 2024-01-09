import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/widgets/icon_display_circle.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class DoubleNotchEvent extends StatelessWidget {
  const DoubleNotchEvent({super.key, required this.walletImage});

  final String walletImage;

  @override
  Widget build(BuildContext context) {
    final controller;
    if (Get.isRegistered<TransactionController>()) {
      controller = Get.find<TransactionController>();
    } else {
      controller = Get.put<TransactionController>(TransactionController());
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
                        Padding(
                          padding: EdgeInsets.only(
                              top: 40,
                              left: MediaQuery.of(context).size.width / 2,
                              right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Amount",
                                style: TextThemeBuilder
                                    .robotoTextTheme.headlineLarge,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onTapOutside: (event) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        hintText: "0 ",
                                        border: InputBorder.none,
                                        hintStyle: TextThemeBuilder
                                            .robotoTextTheme.titleLarge,
                                      ),
                                      controller: controller.incomeTextEdit,
                                      maxLength: 9,
                                      keyboardType: TextInputType.number,
                                      style: TextThemeBuilder
                                          .robotoTextTheme.titleLarge,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'\n')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: SvgPicture.asset(
                                        "assets/images/dIcon.svg"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
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
                        Padding(
                          padding: EdgeInsets.only(
                              top: 40,
                              left: MediaQuery.of(context).size.width / 2,
                              right: 20),
                          // right: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Description",
                                style: TextThemeBuilder
                                    .robotoTextTheme.headlineLarge,
                              ),
                              TextField(
                                onTapOutside: (event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  hintText: "...",
                                  border: InputBorder.none,
                                  hintStyle: TextThemeBuilder
                                      .robotoTextTheme.titleLarge,
                                ),
                                controller: controller.descriptionTextEdit,
                                style: TextThemeBuilder
                                    .robotoTextTheme.headlineLarge,
                                maxLines: 2,
                                maxLength: 30,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\n')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: -10,
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
                        "Event",
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: ColorPalette.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 155,
                  child: Center(
                    child: IconDisplayCircle(pathImage: walletImage),
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
                          "Delete",
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
