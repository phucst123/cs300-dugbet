import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.defaultText),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: context.textTheme.titleMedium),
          Text(description, style: context.textTheme.bodySmall),
        ],
      ),
    );
  }
}
