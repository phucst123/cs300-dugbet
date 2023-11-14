import 'package:dugbet/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: -5,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.incomeText),
                    child: const Text("Expense"),
                  )),
              Positioned(
                  top: 125,
                  child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorPalette.black)),
                      child: const Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 30),
                        ),
                      ))),
              Positioned(
                  top: 280,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.incomeText,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Edit"),
                    ),
                  )),
              Column(
                children: [
                  SvgPicture.asset("assets/images/top_notch.svg",height: 148,),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset("assets/images/bot_notch.svg",height: 148,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
