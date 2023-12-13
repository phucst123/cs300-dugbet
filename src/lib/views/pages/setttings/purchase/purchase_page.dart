import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/widgets/button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              child: GradientButton(
                  title: "Buy for 99.000 đ",
                  callback: () {
                    Get.toNamed(AppPage.premiumPage);
                  }))
        ]),
      ),
    );
  }
}