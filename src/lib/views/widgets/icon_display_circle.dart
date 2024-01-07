import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';

class IconDisplayCircle extends StatelessWidget {
  IconDisplayCircle(
      {super.key, this.pathImage = "assets/images/defaultPlush.png"});

  String pathImage = "assets/images/defaultPlush.png";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorPalette.black, width: 1)),
        child: Image.asset(
          pathImage,
          scale: 0.75,
        ));
  }
}
