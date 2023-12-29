import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/consts/custom_button_style.dart';
import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:dugbet/views/widgets/button/gradient_button.dart';
import 'package:dugbet/views/widgets/string_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({super.key});

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
          ],
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Purchase",
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "What you will get",
            style: context.textTheme.bodySmall,
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/money.svg"),
            title: const Text("Bill Scanning"),
            titleTextStyle: context.textTheme.bodyLarge,
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/wallet.svg"),
            title: const Text("Unlimited Wallets"),
            titleTextStyle: context.textTheme.bodyLarge,
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/moon.svg"),
            title: const Text("Customize Appearance"),
            titleTextStyle: context.textTheme.bodyLarge,
          ),
          Center(
              child: StringButton(
                  text: "Buy for 99.000 đ",
                  callback: () {
                    Get.toNamed(AppPage.premiumPage);
                  },
                  decoration: CustomButtonStyles.gradientTealToTealDecoration,
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: context.textTheme.labelLarge!
                      .merge(const TextStyle(color: ColorPalette.white))))
        ]),
      ),
    );
  }
}
