import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWalletController extends GetxController {
  // RxInt balance = 123000.obs;
  RxInt showValue = 0.obs;
  late User? user;

  @override
  void onReady() {
    super.onReady();
  }

  void onInit() {
    super.onInit();
    // getWallets();
  }
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
