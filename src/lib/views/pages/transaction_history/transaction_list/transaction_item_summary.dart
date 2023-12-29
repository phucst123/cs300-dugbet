import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TransactionItemSummary extends StatelessWidget {
  const TransactionItemSummary({super.key, required this.date, required this.income, required this.expense});
  final DateTime date;
  final String income;
  final String expense;

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
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date_text,
                  style:theme.textTheme.headlineMedium
                ),
                Text(
                  "${date.month.toString()}/${date.year.toString()}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ColorPalette.grey
                  )
                )
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  income.toString(),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: ColorPalette.incomeText
                  )
                ),
                SizedBox(width: 2.0.v),
                SvgPicture.asset(
                  "assets/images/dIcon.svg",
                  colorFilter: const ColorFilter.mode(
                    ColorPalette.incomeText,
                    BlendMode.srcIn
                  ),
                  height: 16.v,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  expense.toString(),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: ColorPalette.expenseText
                  )
                ),
                SizedBox(width: 2.0.v),
                SvgPicture.asset(
                  "assets/images/dIcon.svg",
                  colorFilter: const ColorFilter.mode(
                    ColorPalette.expenseText,
                    BlendMode.srcIn
                  ),
                  height: 16.0.v,
                )
              ],
            )
          ]
        )
      ],
    );
  }
}