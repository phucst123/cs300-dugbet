import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:flutter/material.dart';

class TransactionItemList extends StatelessWidget {
  const TransactionItemList({super.key, required this.transaction_list});
  final List<TransactionTemplate> transaction_list;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var transaction in transaction_list) ...[
          InkWell(
            onTap: onTapTransaction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(transaction.icon),
                    SizedBox(width: 10.0),
                    Text(transaction.title, style: theme.textTheme.bodyMedium),
                  ],
                ),
                Text(
                  transaction.amount.toString(),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: transaction.type == 1
                          ? ColorPalette.incomeText
                          : ColorPalette.expenseText),
                ),
              ],
            ),
          )
        ]
      ],
    );
  }

  onTapTransaction() => Get.toNamed(AppPage.transactionPage);
}
