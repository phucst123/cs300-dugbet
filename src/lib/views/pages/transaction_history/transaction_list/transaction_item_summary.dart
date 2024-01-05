import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionItemSummary extends StatelessWidget {
  const TransactionItemSummary({super.key, required this.date, required this.income, required this.expense});
  final DateTime date;
  final String income;
  final String expense;

  @override
  Widget build(BuildContext context) {
    late final String dateText;
    switch (date.weekday) {
      case 1:
        dateText = "Monday";
        break;
      case 2:
        dateText = "Tuesday";
        break;
      case 3:
        dateText = "Wednesday";
        break;
      case 4:
        dateText = "Thursday";
        break;
      case 5:
        dateText = "Friday";
        break;
      case 6:
        dateText = "Saturday";
        break;
      case 7:
        dateText = "Sunday";
        break;
      default:
        dateText = "Unknown";
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
                  dateText,
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