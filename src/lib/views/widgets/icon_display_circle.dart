import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../consts/color/colors.dart';

// ignore: must_be_immutable
class IconDisplayCircle extends StatelessWidget {
  IconDisplayCircle(
      {super.key, this.pathImage});

  String? pathImage = "";

  @override
  Widget build(BuildContext context) {
    if (pathImage == "") {
      print("OH NO LOI ROI"); 
    }
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorPalette.black, width: 1)),
        child: pathImage != "" && pathImage != null
          ? Image.asset(
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
