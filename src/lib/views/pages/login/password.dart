import 'package:dugbet/views/dialogs/email_dialog.dart';
import 'package:dugbet/views/widgets/custom_text_form_field.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();

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
                        children: [
                          Text(
                            "Change Password",
                            style: theme.textTheme.headlineSmall,
                          ),
                          SizedBox(height: 15.v),
                          Container(
                            width: 323.h,
                            margin: EdgeInsets.symmetric(horizontal: 2.h),
                            child: Text(
                              "Please enter your email address. We will send you an email to reset your password.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(height: 61.v),
                          _buildLoginTextbox(context),
                          SizedBox(height: 8.v),
                          Text(
                            "A valid email address is required",
                            style: theme.textTheme.labelLarge,
                          ),
                          SizedBox(height: 72.v),
                          StringButton(
                            width: 188.h,
                            text: "Send Email",
                            buttonStyle: CustomButtonStyles.none,
                            decoration:
                                CustomButtonStyles.gradientTealToTealDecoration,
                            callback: () => onTapSendEmail(context),
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
  Widget _buildLoginTextbox(BuildContext context) {
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
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  void onTapSendEmail(context) {
    // show EmailDialog
    showDialog(
      context: context,
      builder: (context) => const EmailDialog(),
    );
  }
}
