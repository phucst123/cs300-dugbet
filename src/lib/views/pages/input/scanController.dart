import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ScanController extends GetxController {


  final fileName = "".obs;


  Future<void> updateFileName(ImageSource source) async {
    final imageGetPath = await ImagePicker().pickImage(source: source);
    if(imageGetPath!=null){
      final filepath = File(imageGetPath.path);
      fileName(filepath.path);
    }
  }
}
