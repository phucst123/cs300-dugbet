import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWalletController extends GetxController {
  // RxInt balance = 123000.obs;
  RxInt showValue = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void onInit() {
    super.onInit();
    // getWallets();
  }

  // var walletList = <WalletModel>[];
  // Future<void> getWallets() async {
  //   try {
  //     QuerySnapshot wallets = await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc('vinh123@gmail.com')
  //         .collection('Wallets')
  //         .get();
  //     walletList.clear();
  //     balance.value = 0;
  //     for (var wallet in wallets.docs) {
  //       print("im here to read ${wallet.data()}");
  //       walletList
  //           .add(WalletModel.fromDocumentSnapshot(documentSnapshot: wallet));
  //       balance.value +=
  //           double.parse(wallet['initialAmount'].toString()).toInt();
  //     }
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar("Error", 'Error while getting wallet list',
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  String showBalance(int value) {
    if (showValue.value == 0) {
      return convertToCurrency(value);
    } else {
      return "******";
    }
  }

  void onChangeValue() {
    showValue.value = showValue.value == 0 ? 1 : 0;
    update();
  }

  Icon showEyeIcon() {
    if (showValue.value == 0) {
      return const Icon(Icons.lock_open_outlined);
    } else {
      return const Icon(Icons.lock_outline);
    }
  }

  @override
  void onClose() {}
}
