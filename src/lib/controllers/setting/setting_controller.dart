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

      final profileRef = usersRef.doc(email.value);

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
}
