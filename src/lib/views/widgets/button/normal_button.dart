import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/color/colors.dart';

class NormalButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  NormalButton({
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
          color: ColorPalette.expenseText,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(title, style: context.textTheme.bodyLarge),
        ),
      ),
    );
  }
}
