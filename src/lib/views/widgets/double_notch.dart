import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts/color/colors.dart';

class DoubleNotch extends StatelessWidget {
  const DoubleNotch({super.key});

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
                top: -10,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.incomeText),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Expense"),
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.width/2 - 40,
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
                top: MediaQuery.of(context).size.width-65,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.incomeText,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: Text("Edit"),
                  ),
                )),
            Column(
              children: [
                SvgPicture.asset("assets/images/top_notch.svg",width: MediaQuery.of(context).size.width,),
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset("assets/images/bot_notch.svg",width: MediaQuery.of(context).size.width,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
