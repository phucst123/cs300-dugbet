import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/double_notch.dart';
import 'package:dugbet/views/widgets/double_notch_new_event.dart';
import 'package:dugbet/views/widgets/double_notch_new_wallet.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../../controllers/wallet/wallet_controller.dart';
import '../../widgets/wallet_header.dart';

class WalletNewEvent extends StatelessWidget {
  const WalletNewEvent({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController controller;
    if (Get.isRegistered<WalletController>()) {
      controller = Get.find<WalletController>();
    } else {
      controller = Get.put<WalletController>(WalletController());
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WalletHeader(callback1: (){}, callback2: (){},),
                  Obx(() => Text(
                    controller.bankIcon.value,
                    style: TextThemeBuilder.robotoTextTheme.titleLarge,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  DoubleNotchNewEvent(),
                  const SizedBox(
                    height: 30,
                  ),
                  // Container(
                  //   height: 80,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey, width: 1),
                  //       borderRadius: BorderRadius.circular(20)),
                  //   child: Padding(
                  //     padding:
                  //     const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               "Members",
                  //               style: TextThemeBuilder.robotoTextTheme.headlineLarge,
                  //             ),
                  //             const SizedBox(
                  //               height: 15,
                  //             ),
                  //             Text(
                  //               "3/Member List",
                  //               style: TextThemeBuilder.robotoTextTheme.titleMedium,
                  //             ),
                  //           ],
                  //         ),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // Container(
                  //   height: 40,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey, width: 1),
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20),
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           "Show more details",
                  //           style: TextThemeBuilder.robotoTextTheme.labelLarge,
                  //         ),
                  //         const Spacer(),
                  //         IconButton(
                  //             onPressed: () {},
                  //             icon: const Icon(Icons.keyboard_arrow_down))
                  //       ],
                  //     ),
                  //   ),
                  // ),

                ],
              ),
              const SizedBox(
                height: 50,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  onTapCancel() => Get.back();

  onTapSave(){
     print('hello im ready to add new walltet');
    final new_transaction = Get.find<WalletController>();
    String name = new_transaction.bankIcon.value;
    String id = new_transaction.user!.displayName! + '-' + name.toLowerCase();
    int initialAmount = int.parse(new_transaction.incomeTextEdit.text.replaceAll(',', ''));
    String description = new_transaction.descriptionTextEdit.text;
    String walletPicture = 'assets/Bank/' + name.toLowerCase() + '.png';
    String type = 'Personal';
    int income = 0;
    int expense = 0;
    if (Get.isRegistered<WalletController>()) {
      final controller = Get.find<WalletController>();
      controller.addWallet(name, walletPicture, description, id, type, income, expense, initialAmount);
    } else {
      final controller = Get.put<WalletController>(WalletController());
      controller.addWallet(name, walletPicture, description, id, type, income, expense, initialAmount);
    }
    Get.back();
  }
}
