import 'package:dugbet/consts/colors.dart';
import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/widgets/string_button.dart';
import 'package:dugbet/views/widgets/gradient_background.dart';
import 'package:dugbet/views/widgets/widget_button.dart';
import 'package:dugbet/views/widgets/string_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(children: [
          const SizedBox(
            height: 151,
          ),
          const Text(
            "Dugbet",
            style: TextStyle(
              color: ColorPalette.defaultText,
              fontSize: 36,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Your Financial Compass",
            style: TextStyle(
              color: ColorPalette.defaultText,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          SvgPicture.asset(
            "assets/images/logo.svg",
            height: 300,
          ),
          const SizedBox(
            height: 64,
          ),
        ]),
      ),
      floatingActionButton: WidgetButton(
        callback: () => Get.toNamed(AppPage.homePage),
        isGradient: true,
        child: const Icon(Icons.add),
      ),
      // floatingActionButton: StringButton(
      //   title: "Add",
      //   callback: () => Get.toNamed(AppPage.homePage),
      // ),
    );
  }
}
