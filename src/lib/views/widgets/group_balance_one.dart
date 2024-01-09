import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class GroupBalanceOne extends StatelessWidget {
  const GroupBalanceOne({super.key, required this.eventData});

  final EventModel eventData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: InkWell(
          onTap: () => Get.toNamed(AppPage.walletEventDetail, arguments: eventData),
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
                    "assets/images/group_balance1.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Positioned(
                  top: MediaQuery.of(context).size.width / 7,
                  left: MediaQuery.of(context).size.width / 16,
                  child: Row(
                    children: [
                      Text(convertToCurrency(eventData.initialAmount),
                          style: TextThemeBuilder.robotoTextTheme.displaySmall),
                      SvgPicture.asset(
                        "assets/images/dIcon.svg",
                        height: 27,
                        color: ColorPalette.defaultText,
                      )
                    ],
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.width / 4,
                  left: MediaQuery.of(context).size.width / 16,
                  child: Text("Total Expense",
                      style: TextThemeBuilder.robotoTextTheme.labelLarge)),
            ],
          ),
        ),
      ),
    );
  }
}
