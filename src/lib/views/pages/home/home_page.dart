import 'package:card_swiper/card_swiper.dart';
import 'package:dugbet/consts/colors.dart';
import 'package:flutter/material.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(17,17,17,0),
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
                      Row(
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
                                icon: const Icon(Icons.refresh),
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
                                icon: const Icon(Icons.refresh),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectMode,
                      underline: Container(
                        color: Colors.white,
                        width: 2,
                      ),
                      dropdownColor: ColorPalette.primaryColor.withOpacity(0.6),
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
                Center(
                  child: Swiper(
                    viewportFraction: 0.9,
                    scale: 0.75,
                    itemCount: 5,
                    duration: 1000,
                    loop: true,
                    itemHeight: 200,
                    itemWidth: 250,
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
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  border: Border.all(
                    color: ColorPalette.white,
                    width: 1
                  )


                ),

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text("Total Balance"),
                            SizedBox(width: 20,),
                            Icon(Icons.remove_red_eye_outlined)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    ColorPalette.primaryColor,
                                    ColorPalette.tertiaryColor
                                  ])),
                            ),
                            const Text(
                              "234.000d",
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Your wallet:"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => Container(
                                    width: 314,
                                    height: 60,
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(20)
                                    ),

                                    child: Center(
                                      child: ListTile(
                                        leading: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(colors: [
                                                ColorPalette.primaryColor,
                                                ColorPalette.tertiaryColor
                                              ])),
                                        ),
                                        title: const Text("Momo",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                        subtitle: const Text("200.000d"),
                                        trailing: const Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.menu),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
