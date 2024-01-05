import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/double_notch.dart';
import 'package:flutter/material.dart';
import '../../../consts/custom_button_style.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/string_button.dart';
import '../../widgets/wallet_header.dart';

class WalletNewEvent extends StatelessWidget {
  const WalletNewEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WalletHeader(callback1: (){}, callback2: (){},),
                  Text(
                    "Design ITUS",
                    style: TextThemeBuilder.robotoTextTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DoubleNotch(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Members",
                                style: TextThemeBuilder.robotoTextTheme.headlineLarge,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "3/Member List",
                                style: TextThemeBuilder.robotoTextTheme.titleMedium,
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Show more details",
                            style: TextThemeBuilder.robotoTextTheme.labelLarge,
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.keyboard_arrow_down))
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StringButton(
                    text: "Cancel".tr,
                    callback: onTapCancel,
                    buttonStyle: CustomButtonStyles.none,
                    decoration: CustomButtonStyles.gradientTealToTealDecoration,
                    width: 140.h,
                  ),
                  StringButton(
                    text: "Save".tr,
                    callback: onTapSave,
                    buttonStyle: CustomButtonStyles.none,
                    decoration: CustomButtonStyles.gradientTealToTealDecoration,
                    width: 140.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  onTapCancel() => Get.back();

  onTapSave() => Get.back();
}