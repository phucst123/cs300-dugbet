import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';
import 'package:dugbet/views/dialogs/sign_in_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  late AuthController authController;

  var email = "";
  var password = "";

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authController = Get.find<AuthController>();
  }

  @override
  void onClose() async {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    print("onCLose");
  }

  void signIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    loginFormKey.currentState!.save();

    authController.signIn(email, password);
  }
}
