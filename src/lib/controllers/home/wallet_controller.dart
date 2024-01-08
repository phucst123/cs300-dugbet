import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWalletController extends GetxController {
  RxString money = "0.000".obs;
  RxInt showValue = 0.obs;

  String showMoney() {
    if (showValue.value == 0) {
      return money.value;
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
