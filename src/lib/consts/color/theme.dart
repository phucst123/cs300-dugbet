import 'package:flutter/material.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';

mixin LightTheme {
  static const Color primaryColor = Color(0xFF15A69D);
  static const Color secondaryColor = Color(0xFF24C8BE);
  static const Color tertiaryColor = Color(0xFF2184A5);
  static const Color shadowColor = Color(0xFFDDDDDD); // 9C9AFF
  static const Color backgroundColor = Colors.white; // DDDDDD
  static const Color buttonColor = Color(0xFFF6BB54); // F6BB54
  static const Color errorColor = Color(0xFFFFAFAF);
  static const Color floatingButtonColor = Color(0xFFEAB0FC);

  static final ThemeData theme = ThemeData(
    textTheme: TextThemeBuilder.robotoTextTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: buttonColor,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
      surface: floatingButtonColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onErrorContainer: buttonColor,
      onSurface: Colors.black,
      onBackground: Colors.white,
      onError: Colors.black,
      brightness: Brightness.light,
    ),
  );
}
