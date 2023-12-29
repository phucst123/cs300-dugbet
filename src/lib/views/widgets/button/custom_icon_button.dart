import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/color/colors.dart';

class CustomIconButton extends StatelessWidget {
  /// this widget represent gradient button in application
  /// title: the title of button
  /// callback: which to execute when click on button
  ///

  const CustomIconButton({
    super.key,
    required this.child,
    required this.callback,
  });

  final Widget child;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorPalette.white),
          borderRadius: BorderRadius.circular(10),
          gradient: ColorPalette.primaryGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
