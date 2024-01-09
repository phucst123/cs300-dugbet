import 'package:dugbet/controllers/wallet/wallet_personal_controller.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/widgets/group_balance.dart';
import 'package:dugbet/views/widgets/home_header_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/bottom_sheet_transaction.dart';

class WalletPersonal extends GetView<WalletPersonalController> {
  const WalletPersonal({super.key, required this.walletData});

  final WalletModel walletData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletPersonalController>(
        init: WalletPersonalController(),
        initState: (_) {},
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: HomeHeaderBar(
                leftWidget: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    "assets/icons/arrow.svg",
                    colorFilter: const ColorFilter.mode(
                        ColorPalette.white, BlendMode.srcIn),
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: ColorPalette.tearButton),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, bottom: 20.0, left: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  walletData.name,
                                  style: TextThemeBuilder
                                      .robotoTextTheme.titleLarge,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/edit.svg",
                                ),
                              ],
                            ),
                            DropdownButton<String>(
                              value: controller.selectMode.value,
                              underline: Container(
                                color: Colors.grey,
                                width: 1,
                              ),
                              dropdownColor:
                                  ColorPalette.white.withOpacity(0.9),
                              items: const [
                                // the chart cannot show transactions just for one day
                                // DropdownMenuItem(
                                //     value: "today", child: Text("Today")),
                                DropdownMenuItem(
                                    value: "week", child: Text("This week")),
                                DropdownMenuItem(
                                    value: "month", child: Text("This month")),
                                DropdownMenuItem(
                                    value: "quarter",
                                    child: Text("This quarter")),
                                DropdownMenuItem(
                                    value: "year", child: Text("This year"))
                              ],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              onChanged: (String? value) =>
                                  controller.onModeClick(value!),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GroupBalance(
                          walletData: walletData,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const BottomSheetTransaction()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
