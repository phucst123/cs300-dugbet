import 'package:flutter/material.dart';

import '../../consts/color/theme.dart';
import '../../consts/fonts/text_theme_builder.dart';

class StatOne extends StatelessWidget {
  const StatOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 80,
            width: 180,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("234.000",
                        style: TextThemeBuilder.robotoTextTheme.titleLarge),
                    Text(
                      "Expense",
                      style: TextThemeBuilder.robotoTextTheme.labelLarge,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 50,),
          Container(
            height: 80,
            width: 180,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: LightTheme.primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                      onPressed: () {},
                      icon:
                      const Icon(Icons.arrow_downward_outlined, color: Colors.white),
                    )),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("234.000",
                        style: TextThemeBuilder.robotoTextTheme.titleLarge),
                    Text(
                      "Income",
                      style: TextThemeBuilder.robotoTextTheme.labelLarge,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
