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

  RxBool isPasswordVisible = false.obs;

  String showPassword() {
    if (isPasswordVisible.value) {
      return password;
    } else {
      return "********";
    }
  }

  Widget eyeIcon() {
    if (isPasswordVisible.value) {
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
    isPasswordVisible.value = !isPasswordVisible.value;
  }

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
