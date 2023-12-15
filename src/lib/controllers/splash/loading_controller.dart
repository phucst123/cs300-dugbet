import 'package:dugbet/routes/app_pages.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  // final _loadingResources = true.obs;

  // bool get isLoadingResources => _loadingResources.value;

  @override
  void onReady() async {
    super.onReady();
    await loadResources();
    Get.offAndToNamed(AppPage.loginOpenScreen);
  }

  Future loadResources() async {
    // Load any necessary resources here
    await Future.delayed(const Duration(seconds: 3));

    // _loadingResources.value = false;
  }
}
