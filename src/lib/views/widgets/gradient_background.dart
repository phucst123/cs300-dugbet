import 'package:dugbet/consts/colors.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration:
              const BoxDecoration(gradient: ColorPalette.secondaryGradient),
        )),
        Positioned.fill(child: SafeArea(child: child))
      ],
    );
  }
}
