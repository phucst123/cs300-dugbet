import 'package:dugbet/consts/fonts/base_font.dart';
import 'package:flutter/material.dart';

class BalanceStatus extends StatelessWidget {
  const BalanceStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AmountBox(
          iconData: Icons.arrow_upward,
          figure: '234.000',
          label: 'Expense',
        ),
        AmountBox(
          iconData: Icons.arrow_downward,
          figure: '234.000',
          label: 'Income',
        )
      ],
    );
  }
}

class AmountBox extends StatelessWidget {
  final IconData iconData;
  final String figure;
  final String label;

  const AmountBox({super.key, required this.iconData, required this.figure, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: 160.0,
      height: 100.0,
      padding: const EdgeInsets.only(top: 22.0, bottom: 24.0, left: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.teal,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                figure,
                style: titleLarge,
              ),
              Text(
                label,
                style: bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
