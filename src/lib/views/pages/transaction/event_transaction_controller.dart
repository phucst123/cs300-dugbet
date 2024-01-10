import 'package:dugbet/views/pages/transaction/user_model_demo.dart';
import 'package:dugbet/views/widgets/choose_list_wallet.dart';
import 'package:dugbet/views/widgets/member_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login/auth_controller.dart';
import '../../../firebase_ref/references.dart';

class EventTransactionController extends GetxController {
  final TextEditingController incomeTextEdit = TextEditingController();
  final TextEditingController descriptionTextEdit = TextEditingController();
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  var selectedWallet = "Momo".obs;
  var isIncome = true.obs;
  var isEdit = false.obs;
  var title = "12".obs;
  var category = "Food and beverages".obs;
  var icon = "snack.svg".obs;
  var type = 0.obs;
  var listMember = <UserDemo>[].obs;
  var listUserChoose = <UserDemo>[].obs;

  final TextEditingController nameText = TextEditingController();
  final TextEditingController searchText = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listUserChoose.value = [
      UserDemo("Nguyen Duc Hung", 'pandakig@gmail.com'),
      UserDemo('Hoang Nhu Vinh', 'vinh123@gmail.com'),
      UserDemo("Nguyen Truc Nhu Binh", "test25@gmail.com"),
      UserDemo("Huynh Huu Phuc", "huuphucst123@gmail.com"),
      UserDemo("Tu Canh Minh", "tcm123@gmail.com")
    ];
    listUserChoose.refresh();
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
    nameText.dispose();
    searchText.dispose();
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
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: const ChooseListWallet()),
      ),
    ));
  }

  chooseMembers() {
    Get.dialog(const MemberList());
  }

  Future<void> pushToFirestore() async {
    final user = Get.find<AuthController>().getUser();
    List<Map<String, dynamic>> memberJson =
        listMember.value.map((mem) => mem.toJson()).toList();
    String? user_id = user!.email;
    String? user_name = user!.displayName;


    await usersRef.doc(user_id).collection('Events').add({
        'initialAmount': int.parse(incomeTextEdit.text),
        'eventPicture': "assets/Event/${title.value}.png",
        'startDate': DateTime(
            selectedDate.value.year,
            selectedDate.value.month,
            selectedDate.value.day,
            selectedTime.value.hour,
            selectedTime.value.minute),
        'description': descriptionTextEdit.text,
        'endDate': DateTime.now(),
        'name': nameText.text,
        'id': "${user_name!.toLowerCase()}-${title.value}",
        'members': memberJson
      });




  }
}
