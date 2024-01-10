import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/wallet/wallet_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/widgets/double_notch.dart';
import 'package:dugbet/views/widgets/wallet_header.dart';
import '../../../consts/fonts/text_theme_builder.dart';

class WalletNewWallet extends StatelessWidget {
  const WalletNewWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // WalletHeader(callback1: (){}, callback2: (){},),
                Text(
                  "New Wallet",
                  style: TextThemeBuilder.robotoTextTheme.titleLarge,
                ),
                const SizedBox(
                  width: 10,
                ),
                DoubleNotch(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StringButton(
                  text: "Cancel".tr,
                  callback: onTapCancel,
                  buttonStyle: CustomButtonStyles.none,
                  decoration: CustomButtonStyles.gradientTealToTealDecoration,
                  width: 140.h,
                ),
                StringButton(
                  text: "Save".tr,
                  callback: onTapSave,
                  buttonStyle: CustomButtonStyles.none,
                  decoration: CustomButtonStyles.gradientTealToTealDecoration,
                  width: 140.h,
                ),
                // Container(
                //   height: 44,
                //   width: 140,
                //   decoration: BoxDecoration(
                //       color: LightTheme.primaryColor,
                //       borderRadius: BorderRadius.circular(25)
                //   ),

                //   child: Center(child: Text("Save",style: TextThemeBuilder.robotoTextTheme.headlineLarge,)),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }

  onTapCancel() => Get.back();

  onTapSave() {
    // print('hello im ready to add new walltet');
    // final new_transaction = Get.find<TransactionController>();
    // String name = new_transaction.titleTextEdit.text;
    // String id = new_transaction.user!.displayName! + '-' + name.toLowerCase();
    // int initialAmount = int.parse(new_transaction.incomeTextEdit.text.replaceAll(',', ''));
    // String description = new_transaction.descriptionTextEdit.text;
    // String walletPicture = 'assets/Bank/' + name.toLowerCase() + '.png';
    // String type = 'Personal';
    // int income = 0;
    // int expense = 0;

    //'name': name,
     //   'walletPicture': walletPicture,
     //   'description': description,
      //  'id': id,
      //  'type': type,
      //  'income': income,
      //  'expense': expense,
      //  'initialAmount': initi
      
    // if (Get.isRegistered<WalletController>()) {
    //   final controller = Get.find<WalletController>();
    //   controller.addWallet(name, walletPicture, description, id, type, income, expense, initialAmount);
    // } else {
    //   final controller = Get.put<WalletController>(WalletController());
    //   controller.addWallet(name, walletPicture, description, id, type, income, expense, initialAmount);
    // }
    Get.back();
  }
}
