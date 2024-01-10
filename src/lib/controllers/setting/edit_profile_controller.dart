import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/controllers/setting/setting_controller.dart';
import 'package:dugbet/firebase_ref/references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var isLoading = false.obs;

  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  Rxn<User?> user = Rxn();
  final gender = ''.obs;
  final dob = DateTime.now().obs;

  late TextEditingController nameController;

  late AuthController authController;

  @override
  void onInit() async {
    super.onInit();
    user.value = Get.find<AuthController>().getUser();
    nameController = TextEditingController(text: user.value!.displayName);
    await fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      // from Minh: dung usersRef nhe
      final profileRef =
          usersRef.doc(user.value!.email).collection('settings').doc("profile");

      DocumentSnapshot docSnapshot = await profileRef.get();

      if (docSnapshot.exists) {
        dob.value = createDateTimeObject(docSnapshot['dob']);
        gender.value = docSnapshot['gender'];
      } else {
        print('error fetching data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error while getting data is $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void setSelected(String? value) {
    if (value != null) {
      gender.value = value;
    }
  }

  void chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: dob.value,
        firstDate: DateTime(1970),
        lastDate: DateTime(2025));

    if (pickedDate != null && pickedDate != dob.value) {
      dob.value = pickedDate;
    }
  }

  String convertDateTimeToString(DateTime dateTime) {
    // year in the format yyyy
    String year = dateTime.year.toString();

    // month in the format mm
    String month = dateTime.month.toString();
    if (month.length == 1) {
      month = '0$month';
    }

    // day in the format dd
    String day = dateTime.day.toString();
    if (day.length == 1) {
      day = '0$day';
    }

    // final format
    String yyyymmdd = year + month + day;

    return yyyymmdd;
  }

  DateTime createDateTimeObject(String yyyymmdd) {
    int yyyy = int.parse(yyyymmdd.substring(0, 4));
    int mm = int.parse(yyyymmdd.substring(4, 6));
    int dd = int.parse(yyyymmdd.substring(6, 8));

    DateTime dateTimeObject = DateTime(yyyy, mm, dd);
    return dateTimeObject;
  }

  void updateProfile() {
    // if (!profileFormKey.currentState!.validate()) {
    //   return;
    // }
    profileFormKey.currentState!.save();

    try {
      // from Minh: dung usersRef nhe
      final profileRef =
          usersRef.doc(user.value!.email).collection('settings').doc("profile");

      profileRef.set({
        'gender': gender.value,
        'dob': convertDateTimeToString(dob.value),
      }, SetOptions(merge: true));

      Get.find<SettingController>().updateName(nameController.text);
    } catch (e) {
      print(e);
    }
  }
}
