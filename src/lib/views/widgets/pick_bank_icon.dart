import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PickBankIcon extends StatelessWidget {
  PickBankIcon({super.key});

  final banklist = [
    "ABBank",
    "ACB",
    "Agribank",
    "BIDV",
    "LienVietBank",
    "MBBank",
    "SCB",
    "VietComBank",
    "VietinBank",
    "TPBank",
    "OCB",
    "VPBank",
    "Momo",
    "ZaloPay"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15.0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: banklist.map((bank) => BankItem(bank)).toList(),
        ),
      ),
    );
  }
}

Widget BankItem(String name) {
  return InkWell(
    onTap: () {},
    child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset("assets/Bank/${name.toLowerCase()}.png",
                  width: 50,),
            ),
            const SizedBox(height: 8.0),
            Center(
                child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13.0),
            ))
            //SizedBox(height: 8.0)
          ]),
    ),
  );
}
