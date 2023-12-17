import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.child,
    required this.callback,
  });

  final Widget child;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: ColorPalette.expenseText,
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: child,
        ),
      ),
      onTap: () => callback,
    );
  }
}
