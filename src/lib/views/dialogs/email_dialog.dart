import 'package:dugbet/views/widgets/button/gradient_button.dart';
import 'package:dugbet/views/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/color/colors.dart';

class EmailDialog extends StatelessWidget {
  EmailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Email Sent")),
      titleTextStyle: const TextStyle(
        color: ColorPalette.defaultText,
        fontSize: 24,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
      content:
          const Text("We’ve sent password reset instructions to your mail."),
      contentTextStyle: const TextStyle(
        color: ColorPalette.defaultText,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      actions: <Widget>[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientButton(
                title: "Back to Sign-in",
                callback: () {
                  //
                },
              ),
              ElevatedButton(
                child: Text(
                  "Resend the email more",
                  style: context.textTheme.bodySmall,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
