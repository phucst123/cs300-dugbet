import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../consts/color/colors.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(color: ColorPalette.white, width: 1)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 15),
            const Row(
              children: [
                SizedBox(width: 15),
                Text("Total Balance"),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.remove_red_eye_outlined)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorPalette.white, width: 2),
                      gradient: const LinearGradient(colors: [
                        ColorPalette.primaryColor,
                        ColorPalette.tertiaryColor
                      ])),
                  child: Icon(
                    Icons.attach_money,
                    color: ColorPalette.white,
                  ),
                ),
                const Text(
                  "234.000d",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                Text("Your wallet:"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Row(
                        children: [
                          const SizedBox(width: 15),
                          Container(
                            width: 314,
                            height: 200,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: ColorPalette.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: ColorPalette.black, width: 1)),
                            child: Center(
                              child: ListTile(
                                leading: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ColorPalette.black,
                                            width: 1)),
                                    child:
                                        Image.asset("assets/images/agri.png",scale: 0.75,)),
                                title: const Text(
                                  "Momo",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text("200.000d"),
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
                      )),
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
