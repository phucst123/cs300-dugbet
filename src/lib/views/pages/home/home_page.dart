import 'package:card_swiper/card_swiper.dart';
import 'package:dugbet/consts/colors.dart';
import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/splash_page.dart';
import 'package:dugbet/views/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 115,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Text("Hello, Lune")),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.refresh),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.refresh),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectMode,
                        underline: Container(
                          color: Colors.white,
                          width: 2,
                        ),
                        dropdownColor:
                            ColorPalette.primaryColor.withOpacity(0.6),
                        items: const [
                          DropdownMenuItem(
                              value: "month", child: Text("This month")),
                          DropdownMenuItem(
                              value: "year", child: Text("This year")),
                        ],
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        onChanged: (String? value) {},
                      ),
                    ),
                  ),
                ),
                Swiper(
                  itemCount: 5,
                  duration: 1000,
                  loop: true,
                  itemHeight: 276,
                  itemWidth: 262,
                  layout: SwiperLayout.TINDER,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 44,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(child: const Text("Analyze")),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
