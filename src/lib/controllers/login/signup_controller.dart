import 'package:dugbet/consts/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      userNameController,
      passwordController;

  var email = "";
  var username = "";
  var password = "";

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() async {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  void signUp() async {
    print("here1");
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    print("here2");

    signUpFormKey.currentState!.save();

    print("email: ${email}");
    print("pass: ${[password]}");

    if (email != null && password != null) {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar("Success", "Account Created Successfully",
              snackPosition: SnackPosition.BOTTOM);
          Get.offAndToNamed(AppPage.loginScreen);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar("Weak Password", "The password provided is too weak.",
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar("Email Already in Use",
              "The account already exists for that email.",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
