import 'package:dugbet/consts/color/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class Stat extends StatelessWidget {
  const Stat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: MediaQuery.of(context).size.width / 2.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.incomeText,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text("Details"),
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.width / 120,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.incomeText,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text("Stats"),
                  ),
                )),
            Column(
              children: [
                SvgPicture.asset(
                  "assets/images/notch.svg",
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Positioned(
                top: MediaQuery.of(context).size.width / 5,
                left: MediaQuery.of(context).size.width / 16,
                child: Text("234.000 đ",
                    style: TextThemeBuilder.robotoTextTheme.titleLarge)),
            Positioned(
              top: MediaQuery.of(context).size.width / 10,
              left: MediaQuery.of(context).size.width / 16,
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: LightTheme.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.arrow_upward_outlined, color: Colors.white),
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width / 3.7,
              left: MediaQuery.of(context).size.width / 16,
              child: Text(
                "Expense",
                style: TextThemeBuilder.robotoTextTheme.labelLarge,
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.width / 5,
                left: MediaQuery.of(context).size.width / 1.4,
                child: Text("234.000 đ",
                    style: TextThemeBuilder.robotoTextTheme.titleLarge)),
            Positioned(
              top: MediaQuery.of(context).size.width / 10,
              left: MediaQuery.of(context).size.width / 1.4,
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: LightTheme.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_downward_outlined,
                        color: Colors.white),
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width / 3.7,
              left: MediaQuery.of(context).size.width / 1.4,
              child: Text(
                "Income",
                style: TextThemeBuilder.robotoTextTheme.labelLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
