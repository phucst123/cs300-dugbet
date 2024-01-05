import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({super.key, required this.callback1, required this.callback2});
  final  Function callback1;
  final Function callback2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorPalette.white, width: 2),
                color: ColorPalette.primaryColor),
            child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back,
                      color: ColorPalette.white)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorPalette.white, width: 2),
                color: ColorPalette.primaryColor),
            child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined,
                      color: ColorPalette.white)),
            ),
          ),
        ],
      ),
    );
  }
}
