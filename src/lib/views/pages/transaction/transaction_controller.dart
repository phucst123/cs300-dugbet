import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TextEditingController incomeTextEdit = TextEditingController();
  final TextEditingController descriptionTextEdit = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    incomeTextEdit.dispose();
    descriptionTextEdit.dispose();
  }
}
