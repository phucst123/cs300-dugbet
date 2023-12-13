import 'package:flutter/material.dart';

import '../../../consts/color/colors.dart';

class WalletPage extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration:
          const BoxDecoration(gradient: ColorPalette.secondaryGradient),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                  )
                ],
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                child: Wallet(),
              )
            ],
          ),
        ));
  }
}
