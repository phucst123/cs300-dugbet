import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 10),
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
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
    );
  }
}
