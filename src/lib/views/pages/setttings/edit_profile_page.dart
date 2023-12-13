import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/widgets/button/gradient_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Transform.flip(
            flipX: true,
            child: SvgPicture.asset("assets/icons/arrow.svg"),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Profile",
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 72,
              decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.defaultText),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name", style: context.textTheme.bodySmall),
                  Text("Anomyous", style: context.textTheme.bodyLarge),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 72,
              decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.defaultText),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Email", style: context.textTheme.bodySmall),
                  Text("youremail@email.com",
                      style: context.textTheme.bodyLarge),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 72,
              decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.defaultText),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Date of birth", style: context.textTheme.bodySmall),
                  Text("12/11/2023", style: context.textTheme.bodyLarge),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 72,
              decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.defaultText),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gender", style: context.textTheme.bodySmall),
                  Text("Male", style: context.textTheme.bodyLarge),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                // child: StringButton(title: "Update", callback: () => {}),
                child: GradientButton(
                  title: "Update",
                  callback: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
