import 'package:dugbet/firebase_ref/references.dart';
import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/dialogs/email_dialog.dart';
import 'package:dugbet/views/dialogs/sign_in_dialog.dart';
import 'package:dugbet/views/dialogs/sign_up_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();

  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
  }

  void signIn(email, password) async {
    if (email != null && password != null) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (getUser() != null) {
          // Get.dialog(const SignInDialog(), barrierDismissible: false);
          // Get.snackbar("Success", "Login Successfully",
          //     snackPosition: SnackPosition.BOTTOM);
          showSignInDialog();
        }
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
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  void forgotPassword(email) async {
    if (email != null) {
      try {
        await _auth.sendPasswordResetEmail(email: email).then((value) {
          // Get.snackbar("Success", "Email Sent Successfully",
          //     snackPosition: SnackPosition.BOTTOM);

          showEmailDialog(() => forgotPassword(email));
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

  void signUp(username, email, password) async {
    if (email != null && password != null && username != null) {
      try {
        await _auth
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then(
              (value) => value.user!.updateDisplayName(username),
            );

        final user = _auth.currentUser;

        if (user != null) {
          // Get.snackbar("Success", "Account Created Successfully",
          //     snackPosition: SnackPosition.BOTTOM);

          saveUser(user, username);
          showSignUpDialog();
        }
        ;
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

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  Future<void> saveUser(User? user, String username) async {
    try {
      if (user != null) {
        await userRF.doc(user.email).set({
          "email": user.email,
          "name": username,
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error saving user: $error");
      }
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
      navigateToLoginPage();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  bool isLogged() {
    return _auth.currentUser != null;
  }

  void navigateToLoginPage() {
    Get.offAllNamed(AppPage.loginOpenScreen);
  }

  void navigateToHomePage() {
    Get.offAllNamed(AppPage.homePage);
  }

  void showSignInDialog() {
    Get.dialog(
      const SignInDialog(),
      barrierDismissible:
          false, // Prevent dialog from being dismissed by tapping outside
    );

    Future.delayed(const Duration(seconds: 2), () async {
      await Get.offAndToNamed(AppPage.homePage);
    });
  }

  void showSignUpDialog() {
    Get.dialog(
      const SignUpDialog(),
      barrierDismissible:
          false, // Prevent dialog from being dismissed by tapping outside
    );

    Future.delayed(const Duration(seconds: 2), () async {
      await Get.offAndToNamed(AppPage.loginScreen);
    });
  }

  void showEmailDialog(resend) {
    Get.dialog(
      EmailDialog(resend: resend),
      barrierDismissible:
          false, // Prevent dialog from being dismissed by tapping outside
    );
  }
}
