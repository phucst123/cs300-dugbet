import 'package:dugbet/controllers/wallet/wallet_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/widgets/list_title_wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/color/colors.dart';

class ChooseListWallet extends StatelessWidget {
  const ChooseListWallet({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController controller;
    TransactionController controller2;
    if (Get.isRegistered<WalletController>()) {
      controller = Get.find<WalletController>();
    } else {
      controller = Get.put<WalletController>(WalletController());
    }
    if (Get.isRegistered<TransactionController>()) {
      controller2 = Get.find<TransactionController>();
    } else {
      controller2 = Get.put<TransactionController>(TransactionController());
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.walletList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 310,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    controller2.selectedWallet.value = controller.walletList[index].name;
                    Get.back();
                  },
                  child: Center(
                    child: ListTitleWallet(pathImage: controller.walletList[index].walletPicture,moneyValue: controller.walletList[index].balance.toString(), nameWallet: controller.walletList[index].name),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
