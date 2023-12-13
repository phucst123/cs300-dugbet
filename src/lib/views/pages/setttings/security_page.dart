import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/widgets/button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityPage extends StatelessWidget {
  SecurityPage({super.key});

  final overlayColor =
      MaterialStateProperty.all<Color>(ColorPalette.primaryColor);
  final trackColor =
      MaterialStateProperty.all<Color>(ColorPalette.secondaryColor);
  final thumbColor = MaterialStateProperty.all<Color>(ColorPalette.white);

  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(children: [
          Text(
            "Security",
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enable PIN",
                style: context.textTheme.bodyLarge,
              ),
              Switch(
                value: light,
                onChanged: (bool value) {
                  light = value;
                },
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: thumbColor,
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          GradientButton(
            title: "Change PIN",
            callback: () {},
          ),
          const SizedBox(
            height: 24,
          ),
          GradientButton(
            title: "Change Password",
            callback: () {},
          )
        ]),
      ),
    );
  }
}
