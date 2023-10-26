import 'package:dugbet/consts/colors.dart';
import 'package:flutter/material.dart';

class StringButton extends StatelessWidget {
  const StringButton({super.key, required this.title, required this.callback});

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 78,
        ),
        decoration: BoxDecoration(
          gradient: ColorPalette.primaryGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
