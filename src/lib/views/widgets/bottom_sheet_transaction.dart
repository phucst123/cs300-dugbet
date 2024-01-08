import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_page.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetTransaction extends StatelessWidget {
  const BottomSheetTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 20.0, bottom: 0.0),
        decoration: BoxDecoration(
            color: ColorPalette.white.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            border: Border(
                top: BorderSide(color: ColorPalette.white, width: 1),
                left: BorderSide(color: ColorPalette.white, width: 1),
                right: BorderSide(color: ColorPalette.white, width: 1),
                bottom: BorderSide(color: Colors.white, width: 0))),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/top.svg",
              // height: 20,
              // colorFilter: const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
            ),
            const SizedBox(height: 14.0),
            TransactionList(transaction_list: transaction_list),
          ],
        ));
  }
}
