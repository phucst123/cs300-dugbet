import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../consts/color/colors.dart';
import 'icon_display_circle.dart';

class ListTitleWallet extends StatelessWidget {
  const ListTitleWallet({
    super.key,
    required this.pathImage,
    required this.moneyValue,
    required this.nameWallet,
  });
  final pathImage;
  final moneyValue;
  final nameWallet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconDisplayCircle(pathImage: pathImage),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          nameWallet,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            moneyValue,
            style: const TextStyle(
                color: ColorPalette.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          SvgPicture.asset(
            "assets/images/dIcon.svg",
            height: 12,
            color: ColorPalette.grey,
          )
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: ColorPalette.black,
            ),
          ),
        ],
      ),
    );
  }
}
