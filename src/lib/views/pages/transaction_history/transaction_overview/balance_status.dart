import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/consts/fonts/base_font.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          color: ColorPalette.expenseText,
        ),
        AmountBox(
          iconData: Icons.arrow_downward,
          figure: '234.000',
          label: 'Income',
          color: ColorPalette.incomeText,
        )
      ],
    );
  }
}

class AmountBox extends StatelessWidget {
  final IconData iconData;
  final String figure;
  final String label;
  final Color? color;

  const AmountBox(
      {super.key,
      required this.iconData,
      required this.figure,
      required this.label,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: ColorPalette.black, width: 1),
      ),
      width: context.mediaQuerySize.width / 2 - 25.h,
      padding: const EdgeInsets.only(top: 22.0, bottom: 24.0, left: 12.0),
      child: Row(
        
        children: <Widget>[
          Icon(
            iconData,
            color: ColorPalette.defaultText,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: labelLarge,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    figure,
                    style: titleLarge.copyWith(
                        color: color ?? ColorPalette.defaultText),
                  ),
                  SizedBox(width: 2.v),
                  SvgPicture.asset(
                    ImageConstant.VND,
                    colorFilter: ColorFilter.mode(
                        color ?? ColorPalette.defaultText, BlendMode.srcIn),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
