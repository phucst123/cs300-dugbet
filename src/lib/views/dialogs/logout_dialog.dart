import 'package:dugbet/views/widgets/button/gradient_button.dart';
import 'package:dugbet/views/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../consts/color/colors.dart';

class LogoutDialog extends StatelessWidget {
  LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Logout",
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            Text("Are you sure you want to log out?",
                style: context.textTheme.bodyLarge),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: NormalButton(
                      title: "Cancel",
                      callback: () {
                        Get.back();
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: GradientButton(title: "Logout", callback: () {})),
              ],
            )
          ]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
