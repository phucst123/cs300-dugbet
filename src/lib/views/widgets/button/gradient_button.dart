import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/color/colors.dart';

class GradientButton extends StatelessWidget {
  /// this widget represent gradient button in application
  /// title: the title of button
  /// callback: which to execute when click on button
  ///

  const GradientButton({
    super.key,
    required this.title,
    required this.callback,
  });

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 44,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: ColorPalette.primaryGradient,
        ),
        child: Center(
          child: Text(title,
              style: context.textTheme.labelLarge!
                  .merge(const TextStyle(color: ColorPalette.white))),
        ),
      ),
    );
  }
}
