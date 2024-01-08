import 'package:dugbet/views/widgets/group_balance.dart';
import 'package:flutter/material.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/bottom_sheet_transaction.dart';

class WalletPersonal extends StatelessWidget {
  const WalletPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: ColorPalette.secondaryGradient
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
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
              const GroupBalance(),
              const SizedBox(
                height: 30,
              ),
              const BottomSheetTransaction()

            ],
          ),
        ),
      ),
    );
  }
}
