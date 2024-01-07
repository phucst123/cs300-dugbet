import 'package:dugbet/consts/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = "";

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() async {
    emailController.dispose();
  }

  void forgotPassword() async {
    if (email != null) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email)
            .then((value) {
          Get.snackbar("Success", "Email Sent Successfully",
              snackPosition: SnackPosition.BOTTOM);
          Get.offAndToNamed(AppPage.loginScreen);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("User Not Found", "No user found for that email.",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "Your email went wrong",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
