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
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
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
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
