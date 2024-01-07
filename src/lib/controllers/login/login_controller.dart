import 'package:dugbet/consts/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  var email = "";
  var password = "";

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() async {
    emailController.dispose();
    passwordController.dispose();
  }

  void signIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    loginFormKey.currentState!.save();

    if (email != null && password != null) {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar("Success", "Login Successfully",
              snackPosition: SnackPosition.BOTTOM);
          Get.offAndToNamed(AppPage.homePage);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("User Not Found", "No user found for that email.",
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              "Wrong Password", "Wrong password provided for that user.",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "Your email or password went wrong",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        print(e);
      }
    }

  }
}
