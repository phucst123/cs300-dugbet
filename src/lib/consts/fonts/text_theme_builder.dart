import 'package:flutter/material.dart';

import 'base_font.dart';

class TextThemeBuilder {
  const TextThemeBuilder._();

  static final TextTheme robotoTextTheme = TextTheme(
    displayLarge: displayLarge.copyWith(fontFamily: 'Roboto'),
    displayMedium: displayMedium.copyWith(fontFamily: 'Roboto'),
    displaySmall: displaySmall.copyWith(fontFamily: 'Roboto'),
    headlineMedium: headlineMedium.copyWith(fontFamily: 'Roboto'),
    headlineSmall: headlineSmall.copyWith(fontFamily: 'Roboto'),
    titleLarge: titleLarge.copyWith(fontFamily: 'Roboto'),
    titleMedium: titleMedium.copyWith(fontFamily: 'Roboto'),
    titleSmall: titleSmall.copyWith(fontFamily: 'Roboto'),
    bodyLarge: bodyLarge.copyWith(fontFamily: 'Roboto'),
    bodyMedium: bodyMedium.copyWith(fontFamily: 'Roboto'),
    bodySmall: bodySmall.copyWith(fontFamily: 'Roboto'),
    labelLarge: labelLarge.copyWith(fontFamily: 'Roboto'),
    labelMedium: labelMedium.copyWith(fontFamily: 'Roboto'),
    labelSmall: labelSmall.copyWith(fontFamily: 'Roboto'),
  );
}