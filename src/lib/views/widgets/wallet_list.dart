import 'package:dugbet/consts/color/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';
import 'icon_display_circle.dart';

class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 100),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorPalette.white.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(color: ColorPalette.white, width: 2)),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(bottom: keyboardSpace+80),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "My Wallets",
                          style: TextThemeBuilder.robotoTextTheme.titleMedium
                              ?.copyWith(color: Colors.black),
                        )),
                    Container(
                      color: Colors.grey,
                      width: 2,
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Trip/Event",
                          style: TextThemeBuilder.robotoTextTheme.titleMedium
                              ?.copyWith(color: Colors.grey),
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  style: TextThemeBuilder.robotoTextTheme.titleSmall,
                  decoration: InputDecoration(
                      // fillColor:LightTheme.primaryColor,
                      // filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      hintText: "Search your wallet...",
                      hintStyle: TextStyle(color: ColorPalette.grey.withOpacity(0.7),fontWeight: FontWeight.normal),
                      prefixIcon: const Icon(Icons.search)),


                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 170,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 50,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: ColorPalette.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: ListTile(
                                    leading: IconDisplayCircle(
                                        pathImage: "assets/images/agri.png"),
                                    title: const Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Momo",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        const Text(
                                          "200.000 ",
                                          style: TextStyle(
                                              color: ColorPalette.grey,
                                              fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/dIcon.svg",
                                          height: 14,
                                          color: ColorPalette.grey,
                                        )
                                      ],
                                    ),
                                    trailing: const Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.menu,
                                          color: ColorPalette.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
