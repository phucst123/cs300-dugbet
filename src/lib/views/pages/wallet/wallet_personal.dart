import 'package:dugbet/views/widgets/group_balance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/bottom_sheet_transaction.dart';

class WalletPersonal extends StatelessWidget {
  const WalletPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: ColorPalette.secondaryGradient
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorPalette.white, width: 2),
                          color: ColorPalette.primaryColor),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back,
                                color: ColorPalette.white)),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Momo",
                      style: TextThemeBuilder.robotoTextTheme.titleLarge,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.draw_outlined)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const GroupBalance(),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(child: const BottomSheetTransaction())
            ],
          ),
        ),
      ),
    );
  }
}
