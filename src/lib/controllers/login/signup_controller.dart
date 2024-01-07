import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      userNameController,
      passwordController;

  late AuthController authController;

  var email = "";
  var username = "";
  var password = "";

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();

    authController = Get.find<AuthController>();
  }

  @override
  void onClose() async {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  void signUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    signUpFormKey.currentState!.save();

    authController.signUp(username, email, password);
  }
}
