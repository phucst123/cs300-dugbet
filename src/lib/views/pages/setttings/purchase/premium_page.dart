import 'package:dugbet/views/widgets/button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Purchase",
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "You already have an active ",
                style: context.textTheme.bodyLarge,
              ),
              Text(
                "Premium subscription",
                style: context.textTheme.bodyLarge!
                    .merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset("assets/images/diamond.svg")),
        ],
      ),
    );
  }
}
