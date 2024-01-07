import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rxn<User?> user = Rxn();

  @override
  void onInit() {
    super.onInit();
    user.value = Get.find<AuthController>().getUser();
  }
}
