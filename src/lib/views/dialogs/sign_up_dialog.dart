import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../consts/color/colors.dart';

class SignUpDialog extends StatelessWidget {
  const SignUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Creating new account",
                style: TextStyle(
                  color: ColorPalette.defaultText,
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 24,
            ),
            const Text("Please wait a moment...",
                style: TextStyle(
                  color: ColorPalette.defaultText,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: 100,
              child: Lottie.asset("assets/lottie/loading.json"),
            ),
          ]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
