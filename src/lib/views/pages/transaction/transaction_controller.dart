import 'package:dugbet/views/widgets/choose_list_wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TransactionController extends GetxController {
  final TextEditingController incomeTextEdit = TextEditingController();
  final TextEditingController descriptionTextEdit = TextEditingController();
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  var selectedWallet = "Momo".obs;
  var isIncome = true.obs;
  var isEdit = false.obs;
  var title = "snack".obs;
  var category = "Fnb".obs;
  var icon = "snack.svg".obs;
  var  type = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    incomeTextEdit.dispose();
    descriptionTextEdit.dispose();
  }

  chooseTime() async {
    TimeOfDay? pickTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
    );
    if (pickTime != null && pickTime != selectedTime.value) {
      selectedTime.value = pickTime;
    }
  }

  chooseDate() async {
    DateTime? pickDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (pickDate != null && pickDate != selectedDate.value) {
      selectedDate.value = pickDate;
    }
  }

  chooseWallet() {
    Get.dialog(SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
            child: const ChooseListWallet()),
      ),
    ));
  }


}
