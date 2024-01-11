import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/pages/transaction/event_transaction_controller.dart';
import 'package:dugbet/views/widgets/pick_event_icon.dart';
import 'package:dugbet/views/widgets/search_category_custom.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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
                          // height: 150,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 40,
                              left: MediaQuery.of(context).size.width / 2,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Initial Amount",
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
                                          hintText: "0",
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
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: SvgPicture.asset(
                                          "assets/images/dIcon.svg"),
                                    )
                                  ],
                                ),
                              ],
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
                        Padding(
                            padding: EdgeInsets.only(
                              top: 40,
                              left: MediaQuery.of(context).size.width / 2,
                              right: 20,
                            ),
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
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
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
                                  maxLines: 1,
                                  maxLength: 63,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\n')),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: -10,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.incomeText),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Text("Event",
                          style: TextStyle(color: ColorPalette.white)),
                    ),
                  ),
                ),
                Positioned(
                    top: 155,
                    child: InkWell(
                      onTap: () {
                        // Get.dialog(SearchCategoryCustom(isEvent: true,));
                        Get.dialog(PickEventIcon());
                      },
                      child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorPalette.black)),
                          child: Center(
                            child: Image.asset(
                                "assets/Event/${controller.title.value.toLowerCase()}.png"),
                          )),
                    )),
                Positioned(
                  bottom: -10,
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
