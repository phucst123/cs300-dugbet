import 'package:dugbet/views/widgets/list_title_wallet.dart';
import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';

class ChooseListWallet extends StatelessWidget {
  const ChooseListWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 8,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 310,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: ListTitleWallet(pathImage: "assets/images/defaultPlush.png",moneyValue: "200.000", nameWallet: "Momo"),
                ),
              ),
            ],
          ),
        ));
  }
}
