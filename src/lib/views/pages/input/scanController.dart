import 'dart:io';

import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ScanController extends GetxController {
  final fileName = "".obs;
  final textResult = "".obs;

  Future<void> updateFileName(ImageSource source) async {
    print("EEEEEE");
    final imageGetPath = await ImagePicker().pickImage(source: source);
    if (imageGetPath != null) {
      final filepath = File(imageGetPath.path);
      fileName(filepath.path);
    }
    getImageTotext(fileName.value);
  }

  Future getImageTotext(final imagePath) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(InputImage.fromFilePath(imagePath));
    String text = recognizedText.text.toString();
    textResult(text);
  }

  String getText() {
    return textResult.value;
  }

  int getAmount() {
    String text = textResult.value;
    int amount = 0;
    // capture amount from text with split by \n
    List<String> textList = text.split("\n");
    for (int i = 0; i < textList.length; i++) {
      // if test not contain digit then continue
      if (!textList[i].contains(RegExp(r'[0-9]'))) {
        continue;
      }
      // remove all character except digit
      textList[i] = textList[i].replaceAll(RegExp(r'[^0-9]'), '');
      // if text is empty then continue
      if (textList[i].isEmpty) {
        continue;
      }
      if (textList[i].length > 6) {
        continue;
      }
      if (textList[i].length < 3) {
        continue;
      }
      if (textList[i][0] == '0') {
        continue;
      }
      // if 3 last digit is not zero then continue
      if (textList[i].substring(textList[i].length - 3) != '000') {
        continue;
      }
      // if text is not empty then convert to int
      int value = int.parse(textList[i]);

      //print('Line ${i} is ${textList[i]} and amout = ${value}');
      // if value is greater than amount then set amount
      if (value > amount) {
        amount = value;
      }
    }
    if (amount == 0) {
      // snack bar
      Get.snackbar("Error", "Cannot scan amount");
    } else {
      if (Get.isRegistered<TransactionController>()) {
        final controller = Get.find<TransactionController>();
        controller.isEdit.value = false;
        controller.newTransaction.value = true;
        controller.titleTextEdit.text = "New Bill";
        controller.descriptionTextEdit.text = "";
        controller.incomeTextEdit.text = amount.toString();
      } else {
        final controller =
            Get.put<TransactionController>(TransactionController());
        controller.isEdit.value = false;
        controller.newTransaction.value = true;
        controller.titleTextEdit.text = "New Bill";
        controller.descriptionTextEdit.text = "";
        controller.incomeTextEdit.text = amount.toString();
      }
      Get.back();
    }
    return amount;
  }
}
