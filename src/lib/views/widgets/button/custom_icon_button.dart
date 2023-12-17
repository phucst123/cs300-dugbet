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
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: ColorPalette.primaryGradient,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
