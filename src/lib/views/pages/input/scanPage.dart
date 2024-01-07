import 'dart:io';

import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/consts/color/theme.dart';
import 'package:dugbet/views/pages/input/scanController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../consts/fonts/text_theme_builder.dart';

class Scanning extends StatelessWidget {
  Scanning({super.key});

  final controller = Get.put<ScanController>(ScanController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ColorPalette.black),
            boxShadow: [
              BoxShadow(
                color: ColorPalette.black.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bill Scanning",
                  style: TextThemeBuilder.robotoTextTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: controller.fileName.value != ""
                              ? Image.file(
                                  File(controller.fileName.value),
                                  fit: BoxFit.fill,
                                )
                              : SvgPicture.asset(
                                  'assets/images/logo.svg'), // replace with your placeholder image
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          //Get.toNamed()
                        },
                        child: Text(
                          "Input",
                          style: TextThemeBuilder.robotoTextTheme.titleMedium
                              ?.copyWith(color: Colors.grey),
                        )),
                    Container(
                      color: Colors.grey,
                      width: 2,
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Scan",
                          style: TextThemeBuilder.robotoTextTheme.titleMedium,
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                          onPressed: () {
                            controller.updateFileName(ImageSource.camera);
                          },
                          icon: const Icon(Icons.camera_alt_outlined,
                              color: Colors.white),
                        )),
                    CircleAvatar(
                      backgroundColor: LightTheme.primaryColor,
                      radius: 30,
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            iconSize: 40,
                            icon: const Icon(
                              Icons.document_scanner,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                          onPressed: () {
                            controller.updateFileName(ImageSource.gallery);
                          },
                          icon: const Icon(Icons.image_outlined,
                              color: Colors.white),
                        ))
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
