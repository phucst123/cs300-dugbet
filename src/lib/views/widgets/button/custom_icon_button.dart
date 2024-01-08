import 'package:flutter/material.dart';

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
        //asign min width to button,
        //if you want to assign width to button, you can use width property
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
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
