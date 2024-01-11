import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:flutter_svg/flutter_svg.dart';

const maxDescription = 16;
const maxTitle = 14;

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
            onTap: () {
              onTapTransaction(transaction);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      // check if the transaction is the final transaction of the day
                      transaction_list.indexOf(transaction) ==
                              transaction_list.length - 1
                          ? "assets/images/dash_end.svg"
                          : "assets/images/dash.svg",
                      height: 48.v,
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.grey, BlendMode.srcIn),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.white,
                        borderRadius: BorderRadius.circular(18.v),
                        border:
                            Border.all(color: ColorPalette.black, width: 1.0.v),
                      ),
                      height: 36.v,
                      width: 36.v,
                      child: SvgPicture.asset(
                        "assets/icons/category/${transaction.category.toLowerCase()}/${transaction.icon.toLowerCase()}.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            transaction.title.length > maxTitle
                                ? '${transaction.title.substring(0, maxTitle)}...'
                                : transaction.title,
                            style: theme.textTheme.bodyMedium),
                        Text(
                            transaction.description.length > maxDescription
                                ? '${transaction.description.substring(0, maxDescription)}...'
                                : transaction.description,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: ColorPalette.grey)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      convertToCurrency(transaction.amount),
                      style: theme.textTheme.headlineLarge?.copyWith(
                          color: transaction.type == 1
                              ? ColorPalette.incomeText
                              : ColorPalette.expenseText),
                    ),
                    SvgPicture.asset(
                      "assets/images/dIcon.svg",
                      colorFilter: ColorFilter.mode(
                          transaction.type == 1
                              ? ColorPalette.incomeText
                              : ColorPalette.expenseText,
                          BlendMode.srcIn),
                    )
                  ],
                ),
              ],
            ),
          )
        ]
      ],
    );
  }

  onTapTransaction(TransactionTemplate transaction) {
    if (Get.isRegistered<TransactionController>()) {
      final controller = Get.find<TransactionController>();
      controller.title.value = transaction.title;
      controller.icon.value = transaction.icon;
      controller.type.value = transaction.type;
      controller.category.value = transaction.category;
      controller.isEdit.value = true;
      controller.incomeTextEdit.text = convertToCurrency(transaction.amount);
      controller.descriptionTextEdit.text = transaction.description;
      controller.titleTextEdit.text = transaction.title;
      controller.selectedDate.value = transaction.date;
      controller.selectedTime.value = TimeOfDay.fromDateTime(transaction.date);
      controller.newTransaction.value = false;
    } else {
      final controller =
          Get.put<TransactionController>(TransactionController());
      controller.title.value = transaction.title;
      controller.icon.value = transaction.icon;
      controller.type.value = transaction.type;
      controller.category.value = transaction.category;
      controller.isEdit.value = true;
      controller.incomeTextEdit.text = convertToCurrency(transaction.amount);
      controller.descriptionTextEdit.text = transaction.description;
      controller.titleTextEdit.text = transaction.title;
      controller.selectedDate.value = transaction.date;
      controller.selectedTime.value = TimeOfDay.fromDateTime(transaction.date);
      controller.newTransaction.value = false;
    }
    print(transaction.date);

    Get.toNamed(AppPage.transactionPage);
  }
}
