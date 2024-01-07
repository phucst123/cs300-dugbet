import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  final DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Uploading completed"),
      ),
    );
  }
}