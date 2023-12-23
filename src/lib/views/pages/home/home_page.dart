import 'package:card_swiper/card_swiper.dart';
import 'package:dugbet/views/widgets/header_bar.dart';
import 'package:dugbet/views/widgets/stat_one.dart';
import 'package:dugbet/views/widgets/wallet.dart';
import 'package:flutter/material.dart';

import '../../../consts/color/colors.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  String selectMode = "month";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration:
            const BoxDecoration(gradient: ColorPalette.secondaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButton<String>(
                    value: selectMode,
                    underline: Container(
                      color: Colors.grey,
                      width: 1,
                    ),
                    dropdownColor: ColorPalette.white.withOpacity(0.9),
                    items: const [
                      DropdownMenuItem(
                          value: "today", child: Text("Today")),
                      DropdownMenuItem(
                          value: "week", child: Text("This week")),
                      DropdownMenuItem(
                          value: "month", child: Text("This month")),
                      DropdownMenuItem(
                          value: "quarter", child: Text("This quarter")),
                      DropdownMenuItem(
                          value: "year", child: Text("This year"))
                    ],
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    onChanged: (String? value) {
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Swiper(
                viewportFraction: 0.9,
                scale: 0.75,
                itemCount: 5,
                duration: 1000,
                loop: true,
                itemHeight: 250,
                itemWidth: 270,
                layout: SwiperLayout.TINDER,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(78, 12, 78, 12),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 44,
                  width: 130,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        ColorPalette.primaryColor,
                        ColorPalette.tertiaryColor
                      ]),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                      child: Text(
                    "Analyze",
                    style: TextStyle(color: ColorPalette.white),
                  )),
                ),
              ),
            ),
            const Expanded(child: Wallet())
          ],
        ),
      )),
    );
  }
}
