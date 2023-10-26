import 'package:dugbet/consts/colors.dart';
import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    super.key,
    this.child,
    required this.callback,
    this.isGradient = false,
    this.isBorder = false,
  });

  final Widget? child;
  final VoidCallback callback;
  final bool isGradient;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: isBorder
                ? Border.all(
                    color: ColorPalette.white,
                    width: 1,
                    style: BorderStyle.solid,
                  )
                : null,
            gradient: isGradient ? ColorPalette.primaryGradient : null),
        child: Center(child: child),
      ),
      onTap: callback,
    );
  }
}
