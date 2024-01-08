import 'package:dugbet/controllers/login/signup_controller.dart';
import 'package:dugbet/views/widgets/custom_text_form_field.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class LoginSignUpScreen extends GetWidget<SignupController> {
  const LoginSignUpScreen({super.key});

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
              key: controller.signUpFormKey,
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
          controller: controller.emailController,
          onSaved: (value) {
            controller.email = value!;
          },
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
          controller: controller.userNameController,
          onSaved: (value) {
            controller.username = value!;
          },
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
        Obx(() {
          return CustomTextFormField(
            controller: controller.passwordController,
            onSaved: (value) {
              controller.password = value!;
            },
            hintText: "*********",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 16.v, 14.h, 16.v),
              child: InkWell(
                  onTap: controller.changeEye, child: controller.eyeIcon()),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 48.v,
            ),
            obscureText: !controller.isPasswordVisible.value,
            contentPadding: EdgeInsets.only(
              left: 8.h,
              top: 15.v,
              bottom: 15.v,
            ),
          );
        }),
      ],
    );
  }

  void onTapSignUp() async {
    controller.signUp();
  }
}
