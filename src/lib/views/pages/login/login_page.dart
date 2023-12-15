import 'package:dugbet/views/widgets/custom_text_form_field.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginLoginScreen extends StatelessWidget {
  LoginLoginScreen({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            horizontal: 14.h,
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
                                "Login",
                                style: theme.textTheme.headlineSmall,
                              ),
                              SizedBox(height: 43.v),
                              _buildLoginTextboxEmail(context),
                              SizedBox(height: 23.v),
                              _buildLoginTextboxPassword(context),
                              SizedBox(height: 8.v),
                              _buildFrame(context),
                              SizedBox(height: 57.v),
                              StringButton(
                                width: 188.h,
                                text: "Get Started",
                                buttonStyle: CustomButtonStyles.none,
                                decoration: CustomButtonStyles
                                    .gradientTealToTealDecoration,
                                callback: onTapGetStarted,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginTextboxEmail(BuildContext context) {
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
  Widget _buildLoginTextboxPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            child: SizedBox(
              height: 18.v,
              child: Text(
                "Forget Password",
                style: theme.textTheme.labelLarge,
              ),
            ),
            onTap: () => Get.offAndToNamed(AppPage.loginPasswordScreen)),
        InkWell(
            child: SizedBox(
              height: 18.v,
              child: Text(
                "Sign up",
                style: theme.textTheme.labelLarge,
              ),
            ),
            onTap: () => Get.offAndToNamed(AppPage.loginSignUpScreen)),
      ],
    );
  }

  void onTapGetStarted() => Get.offAndToNamed(AppPage.homePage);
}
