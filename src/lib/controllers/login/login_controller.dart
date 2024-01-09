import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/auth_controller.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  late AuthController authController;

  RxnBool isPasswordVisible = RxnBool(false);

  var email = "";
  var password = "";

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isPasswordVisible.value = false;
    authController = Get.find<AuthController>();
  }

  String showPassword() {
    if (isPasswordVisible.value!) {
      return password;
    } else {
      return "********";
    }
  }

  Widget eyeIcon() {
    if (isPasswordVisible.value!) {
      return CustomImageView(
        imagePath: ImageConstant.imgFirreyecrossed,
        height: 16.adaptSize,
        width: 16.adaptSize,
      );
    } else {
      return CustomImageView(
        imagePath: "assets/icons/fi-rr-eye.svg",
        height: 16.adaptSize,
        width: 16.adaptSize,
      );
    }
  }

  void changeEye() {
    isPasswordVisible.value = !isPasswordVisible.value!;
  }

  @override
  void onClose() async {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    loginFormKey.currentState!.save();

    authController.signIn(email, password);
  }
}
