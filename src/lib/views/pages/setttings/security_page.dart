import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/widgets/string_button.dart';
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
      body: Column(children: [
        Text(
          "Security",
          style: context.textTheme.titleLarge,
        ),
        SizedBox(
          height: 40,
        ),
        SwitchListTile(
          title: Text(
            "Enable PIN",
            style: context.textTheme.bodyLarge,
          ),
          value: light,
          onChanged: (bool value) {
            light = value;
          },
          overlayColor: overlayColor,
          trackColor: trackColor,
          thumbColor: thumbColor,
        ),
        StringButton(
          title: "Change PIN",
          callback: () {},
        ),
        StringButton(
          title: "Change Password",
          callback: () {},
        )
      ]),
    );
  }
}
