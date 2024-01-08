import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWalletController extends GetxController {
  RxInt balance = 123000.obs;
  RxInt showValue = 0.obs;

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
