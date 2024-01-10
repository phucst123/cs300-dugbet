import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:flutter/foundation.dart';

class SettingController extends GetxController {
  var isLoading = false.obs;
  var isPremium = false.obs;
  var email = "".obs;
  var name = "".obs;

  @override
  void onInit() {
    super.onInit();
    var user = Get.find<AuthController>().getUser()!;
    email.value = user.email!;
    name.value = user.displayName!;
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      final profileRef = firestore.collection('Users').doc(email.value);

      DocumentSnapshot docSnapshot = await profileRef.get();

      if (docSnapshot.exists) {
        isPremium.value = docSnapshot["isPremium"];
      } else {
        if (kDebugMode) {
          print('error fetching data premium status');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void upgradePremium() {
    isPremium.value = true;
    syncData();
  }

  void updateName(String newName) {
    name.value = newName;
    Get.find<AuthController>().getUser()!.updateDisplayName(newName);
  }

  Future<void> syncData() async {
    try {
      final profileRef = firestore.collection('Users').doc(email.value);

      await profileRef.set({
        "email": email.value,
        "name": name.value,
        "isPremium": isPremium.value,
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
