import 'package:dugbet/views/widgets/string_button.dart';
import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';

class EmailDialog extends StatelessWidget {
  const EmailDialog({super.key});

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
              StringButton(
                title: "Back to Sign-in",
                isGradient: true,
                callback: () {
                  //Navigator.of(context).pop();
                },
              ),
              StringButton(
                title: "Resend the email more",
                style: const TextStyle(
                  color: ColorPalette.defaultText,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
                callback: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
