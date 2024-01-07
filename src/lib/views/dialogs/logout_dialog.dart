import 'package:dugbet/consts/custom_button_style.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/views/widgets/string_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  child: StringButton(
                    text: "Cancel",
                    callback: () {
                      Get.back();
                    },
                    buttonStyle: CustomButtonStyles.fillTear,
                    buttonTextStyle: context.textTheme.labelLarge!,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StringButton(
                    text: "Logout",
                    callback: () {
                      final authController = Get.find<AuthController>();
                      authController.signOut();
                    },
                    decoration: CustomButtonStyles.gradientTealToTealDecoration,
                    buttonStyle: CustomButtonStyles.none,
                    buttonTextStyle: context.textTheme.labelLarge!
                        .merge(const TextStyle(color: ColorPalette.white)),
                  ),
                ),
              ],
            )
          ]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
