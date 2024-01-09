import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/models/WalletModel.dart';

class HomeWalletController extends GetxController {
  RxInt balance = 123000.obs;
  RxInt showValue = 0.obs;
  late User? user;

  var walletList = <WalletModel>[];
  @override
  void onReady() {
    super.onReady();

  }

  void onInit() {
    super.onInit();
    user = Get.find<AuthController>().getUser();
  }

  Future <void> getWallets() async {
    String? user_id = user!.email;
    try {
      QuerySnapshot wallets = await usersRef.doc(user_id).collection('Wallets').get();
      walletList.clear();
      balance.value = 0;
      for (var wallet in wallets.docs) {
        print("im here to read ${wallet.data()}");
        walletList.add(WalletModel.fromDocumentSnapshot(documentSnapshot: wallet));
        balance.value += double.parse(wallet['initialAmount'].toString()).toInt();
      }
    }
    catch (e) {
      print(e);
      Get.snackbar("Error", 'Error while getting wallet list',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  String showBalance() {
    if (showValue.value == 0) {
      return convertToCurrency(balance.value);
    } else {
      return "******";
    }
  }

  void onChangeValue() {
    showValue.value = showValue.value == 0 ? 1 : 0;
    update();
  }

  Icon showEyeIcon()
  {
    if (showValue.value == 0) {
      return const Icon(Icons.lock_open_outlined);
    } else {
      return const Icon(Icons.lock_outline);
    }
  }

  @override
  void onClose() {}
}
