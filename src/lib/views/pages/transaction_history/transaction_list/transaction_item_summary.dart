import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter/material.dart';

class TransactionItemSummary extends StatelessWidget {
  const TransactionItemSummary({super.key, required this.date, required this.income, required this.expense});
  final DateTime date;
  final double income;
  final double expense;

  @override
  Widget build(BuildContext context) {
    late final String date_text;
    switch (date.weekday) {
      case 1:
        date_text = "Monday";
        break;
      case 2:
        date_text = "Tuesday";
        break;
      case 3:
        date_text = "Wednesday";
        break;
      case 4:
        date_text = "Thursday";
        break;
      case 5:
        date_text = "Friday";
        break;
      case 6:
        date_text = "Saturday";
        break;
      case 7:
        date_text = "Sunday";
        break;
      default:
        date_text = "Unknown";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Text(
              date.day.toString(),
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  date_text,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${date.month.toString()}/${date.year.toString()}",
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              income.toString(),
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: ColorPalette.incomeText
              ),
            ),
            Text(
              expense.toString(),
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: ColorPalette.expenseText
              ),
            )
          ]
        )
      ],
    );
  }
}