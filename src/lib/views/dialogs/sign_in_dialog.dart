import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../consts/color/colors.dart';

class SignInDialog extends StatelessWidget {
  const SignInDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Login to your account",
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
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child:
                  Lottie.asset("assets/lottie/loading.json", fit: BoxFit.cover),
            ),
          ]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
