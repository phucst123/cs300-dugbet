
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/login/open_controller.dart';

class LoginOpenScreen extends GetWidget<LoginOpenController> {
  const LoginOpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: const Alignment(0.5, 0),
                        end: const Alignment(0.5, 1),
                        colors: [appTheme.green200, appTheme.blue100])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 32.v),
                    child: Column(children: [
                      SizedBox(height: 42.v),
                      Container(
                          height: 220.adaptSize,
                          width: 220.adaptSize,
                          padding: EdgeInsets.symmetric(
                              horizontal: 42.h, vertical: 52.v),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder110),
                          child: CustomImageView(
                              imagePath: ImageConstant.logo,
                              height: 114.v,
                              width: 130.h,
                              alignment: Alignment.centerLeft)),
                      SizedBox(height: 26.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgClose,
                          height: 8.v,
                          width: 36.h),
                      SizedBox(height: 47.v),
                      Text("Dugbet".tr, style: theme.textTheme.displaySmall),
                      SizedBox(height: 7.v),
                      Text("Your Financial Compass".tr,
                          style: theme.textTheme.titleLarge),
                      const Spacer(),
                      StringButton(
                        text: "Create Account".tr,
                        callback: onTapCreateAccount,
                        buttonStyle: CustomButtonStyles.none,
                        decoration:
                            CustomButtonStyles.gradientTealToTealDecoration,
                        width: 188.h,
                      ),
                      SizedBox(height: 10.v),
                      // CustomElevatedButton(
                      //     width: 188.h,
                      //     text: "Login".tr,
                      //     buttonStyle: CustomButtonStyles.fillWhiteA,
                      //     buttonTextStyle:
                      //         CustomTextStyles.titleMediumBluegray900,
                      //     onPressed: () {
                      //       onTapLogin();
                      //     })
                      StringButton(
                        text: "Login",
                        callback: onTapLogin,
                        width: 188.h,
                        buttonTextStyle:
                            CustomTextStyles.titleMediumBluegray900,
                        buttonStyle: CustomButtonStyles.fillWhiteA,
                      ),
                    ])))));
  }

  /// Navigates to the loginSignUpScreen when the action is triggered.
  onTapCreateAccount() => Get.offAndToNamed(
        AppPage.loginSignUpScreen,
      );

  /// Navigates to the loginLoginScreen when the action is triggered.
  onTapLogin() => Get.offAndToNamed(
        AppPage.loginLoginScreen,
      );
}
