import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';

class StringButton extends StatelessWidget {
  const StringButton(
      {super.key,
      required this.title,
      required this.callback,
      this.style,
      this.isGradient = false});

  final String title;
  final VoidCallback callback;
  final bool isGradient;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 36,
        ),
        decoration: BoxDecoration(
          gradient: isGradient ? ColorPalette.primaryGradient : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: style ??
              TextStyle(
                  color: isGradient
                      ? ColorPalette.white
                      : ColorPalette.defaultText,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
