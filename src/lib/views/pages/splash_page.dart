import 'package:dugbet/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("SplashPage demo")),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Get.toNamed(AppPage.homePage),
        child: const Icon(Icons.add),
      ),
    );
  }
}
