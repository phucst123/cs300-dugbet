import 'package:flutter/material.dart';

class ColorPalette {
  // Default
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Colors
  static const Color primaryColor = Color(0xFF15A69D);
  static const Color secondaryColor = Color(0xFF24C8BE);
  static const Color tertiaryColor = Color(0xFF2184A5);

  // Gradient
  static const Color gradientAlphaStart = primaryColor;
  static const Color gradientAlphaEnd = tertiaryColor;
  static const Color gradientBetaStart = Color(0xFFA1D085);
  static const Color gradientBetaEnd = Color(0xFFCCDDF6);

  // Text
  static const Color defaultText = Color(0xFF1A1A4D);
  static const Color incomeText = Color(0xFF17978F);
  static const Color expenseText = Color(0xFFF6BB54);

  static const primaryGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [
        gradientAlphaStart,
        gradientAlphaEnd,
      ]);

  static const secondaryGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [
        gradientBetaStart,
        gradientBetaEnd,
      ]);
}
