import 'package:flutter/material.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/wallet.dart';
import '../../widgets/wallet_list.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      decoration: const BoxDecoration(gradient: ColorPalette.secondaryGradient),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Text(
              "Wallets",
              style: TextThemeBuilder.robotoTextTheme.displaySmall,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,

            child: WalletList(),
          )
        ],
      ),
    ));
  }
}
