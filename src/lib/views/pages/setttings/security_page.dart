import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/consts/custom_button_style.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:dugbet/views/widgets/string_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomIconButton(
                child: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    "assets/icons/arrow.svg",
                    colorFilter: const ColorFilter.mode(
                        ColorPalette.white, BlendMode.srcIn),
                  ),
                ),
                callback: () {
                  Get.back();
                },
              ),
            ),
            // Your widgets here
          ],
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          StringButton(
            text: "Change PIN",
            callback: () {},
            decoration: CustomButtonStyles.gradientTealToTealDecoration,
            buttonStyle: CustomButtonStyles.none,
            buttonTextStyle: context.textTheme.labelLarge!
                .merge(const TextStyle(color: ColorPalette.white)),
          ),
          const SizedBox(
            height: 24,
          ),
          StringButton(
              text: "Change Password",
              callback: () {},
              decoration: CustomButtonStyles.gradientTealToTealDecoration,
              buttonStyle: CustomButtonStyles.none,
              buttonTextStyle: context.textTheme.labelLarge!
                  .merge(const TextStyle(color: ColorPalette.white))),
        ]),
      ),
    );
  }
}
