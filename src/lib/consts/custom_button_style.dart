import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:dugbet/consts/app_export.dart';


/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillWhiteA => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorPalette.white),
        overlayColor: MaterialStateColor.resolveWith(
            (states) => ColorPalette.primaryColor.withOpacity(0.1)),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.h),
          ),
        ),
      );

  // Gradient button style
  static BoxDecoration get gradientTealToTealDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(22.h),
        gradient: ColorPalette.primaryGradient
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.h),
          ),
        ),
      );
}
