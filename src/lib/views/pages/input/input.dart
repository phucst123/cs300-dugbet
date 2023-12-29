import 'package:dugbet/consts/color/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts/fonts/text_theme_builder.dart';

class Scanning extends StatelessWidget {
  const Scanning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24)
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      height: 300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
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
              const SizedBox(height: 10),
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
                        onPressed: () {},
                        icon: const Icon(Icons.photo, color: Colors.white),
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
                        onPressed: () {},
                        icon: const Icon(Icons.file_present, color: Colors.white),
                      ))
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
