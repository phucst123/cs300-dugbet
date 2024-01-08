import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';

class IconDisplayCircle extends StatelessWidget {
  IconDisplayCircle(
      {super.key, this.pathImage});

  String? pathImage = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorPalette.black, width: 1)),
        child: pathImage != ""
          ? Image.network(
              pathImage!,
              scale: 0.75,
            )
          : Image.asset(
              "assets/images/defaultPlush.png",
              scale: 0.75,
            ),
            );
  }
}
