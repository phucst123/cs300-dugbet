import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/widgets/group_balance.dart';
import 'package:dugbet/views/widgets/home_header_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/bottom_sheet_transaction.dart';

class WalletPersonal extends StatelessWidget {
  const WalletPersonal({super.key, required this.walletData});

  final WalletModel walletData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeHeaderBar(
          leftWidget: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              "assets/icons/arrow.svg",
              colorFilter:
                  const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
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
                      top: 12.0, bottom: 20.0, left: 16.0),
                  child: Row(
                    children: [
                      Text(
                        walletData.name,
                        style: TextThemeBuilder.robotoTextTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        "assets/icons/edit.svg",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GroupBalance(walletData: walletData,),
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
  }
}
