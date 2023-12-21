import 'package:dugbet/consts/color/theme.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';
import 'package:dugbet/views/widgets/double_notch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const DoubleNotch(),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time",
                      style: TextThemeBuilder.robotoTextTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text("20:30",
                            style:
                                TextThemeBuilder.robotoTextTheme.titleMedium),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("09:Oct:2023",
                            style: TextThemeBuilder.robotoTextTheme.titleMedium)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 72,
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
                          "Wallet",
                          style: TextThemeBuilder.robotoTextTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Momo",
                          style: TextThemeBuilder.robotoTextTheme.titleMedium,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        child: Center(
                          child: SvgPicture.asset("assets/images/momo.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Show more details",style: TextThemeBuilder.robotoTextTheme.labelLarge,),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 44,
                  width: 140,
                  decoration: BoxDecoration(
                    color: LightTheme.buttonColor,
                    borderRadius: BorderRadius.circular(25)
                  ),

                  child: Center(child: Text("Cancel",style: TextThemeBuilder.robotoTextTheme.headlineLarge,)),
                ),
                Container(
                  height: 44,
                  width: 140,
                  decoration: BoxDecoration(
                      color: LightTheme.primaryColor,
                      borderRadius: BorderRadius.circular(25)
                  ),

                  child: Center(child: Text("Save",style: TextThemeBuilder.robotoTextTheme.headlineLarge,)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
