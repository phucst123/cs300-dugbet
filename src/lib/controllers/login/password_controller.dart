import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = "";

  late AuthController authController;

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();

    authController = Get.find<AuthController>();
  }

  @override
  void onClose() async {
    emailController.dispose();
  }

  void forgotPassword() async {
    if (!passwordFormKey.currentState!.validate()) {
      return;
    }

    passwordFormKey.currentState!.save();

    authController.forgotPassword(email);
  }
}
