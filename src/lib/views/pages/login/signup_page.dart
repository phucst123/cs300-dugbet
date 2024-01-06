import 'package:dugbet/controllers/login/signup_controller.dart';
import 'package:dugbet/views/widgets/custom_text_form_field.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class LoginSignUpScreen extends GetWidget<SignupController> {
  LoginSignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  signUp(String email, String password) async {
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

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.5, 0),
                end: const Alignment(0.5, 1),
                colors: [
                  appTheme.green200,
                  appTheme.blue100,
                ],
              ),
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 74.v),
                    Container(
                      height: 220.adaptSize,
                      width: 220.adaptSize,
                      padding: EdgeInsets.symmetric(
                        horizontal: 42.h,
                        vertical: 52.v,
                      ),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder110,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.logo,
                        height: 114.v,
                        width: 130.h,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    SizedBox(height: 26.v),
                    SizedBox(
                      height: 8.v,
                      child: AnimatedSmoothIndicator(
                        activeIndex: 0,
                        count: 2,
                        effect: ScrollingDotsEffect(
                          activeDotColor: const Color(0X1212121D),
                          dotHeight: 8.v,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.h,
                        vertical: 27.v,
                      ),
                      decoration: AppDecoration.outlineWhiteA.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL30,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: theme.textTheme.headlineSmall,
                          ),
                          SizedBox(height: 3.v),
                          _buildLoginEmail(context),
                          SizedBox(height: 19.v),
                          _buildLoginUsername(context),
                          SizedBox(height: 19.v),
                          _buildLoginPassword(context),
                          SizedBox(height: 21.v),
                          InkWell(
                              child: SizedBox(
                                height: 18.v,
                                child: Text(
                                  "Already have an Account",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              onTap: () =>
                                  Get.offAndToNamed(AppPage.loginScreen)),
                          SizedBox(height: 2.v),
                          StringButton(
                            width: 188.h,
                            text: "Sign Up",
                            buttonStyle: CustomButtonStyles.none,
                            decoration:
                                CustomButtonStyles.gradientTealToTealDecoration,
                            callback: onTapSignUp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: theme.textTheme.bodySmall,
        ),
        SizedBox(height: 3.v),
        CustomTextFormField(
          controller: emailController,
          hintText: "loremipsum@abc.com",
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildLoginUsername(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Username",
          style: theme.textTheme.bodySmall,
        ),
        SizedBox(height: 3.v),
        CustomTextFormField(
          controller: userNameController,
          hintText: "anomyous",
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildLoginPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Put text in a container with a fixed height = 18.v
        Text(
          "Password",
          style: theme.textTheme.bodySmall,
        ),
        SizedBox(height: 3.v),
        CustomTextFormField(
          controller: passwordController,
          hintText: "*********",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 16.v, 14.h, 16.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgFirreyecrossed,
              height: 16.adaptSize,
              width: 16.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 48.v,
          ),
          obscureText: true,
          contentPadding: EdgeInsets.only(
            left: 8.h,
            top: 15.v,
            bottom: 15.v,
          ),
        ),
      ],
    );
  }

  void onTapSignUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      signUp(emailController.text, passwordController.text);
    }
  }
}
